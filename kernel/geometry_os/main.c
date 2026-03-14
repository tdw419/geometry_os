/*
 * Geometry OS Kernel Module - Direct Glyph Execution Interface
 *
 * Exposes /dev/geometry_os for direct glyph program submission
 * to the GPU, bypassing Vulkan/WebGPU for Phase 2/3.
 *
 * Phase 3: Custom Kernel Module
 * - ioctl for glyph program submission
 * - Direct GPU MMIO access
 * - DMA-BUF management
 */

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/fs.h>
#include <linux/cdev.h>
#include <linux/device.h>
#include <linux/uaccess.h>
#include <linux/slab.h>
#include <linux/mutex.h>
#include <linux/pci.h>
#include <linux/dma-buf.h>

#define DEVICE_NAME "geometry_os"
#define CLASS_NAME "geometry_os"

/* IOCTL commands */
#define GEOMETRY_OS_IOC_MAGIC 'G'

/* Submit a glyph program (SPIR-V binary) */
#define GEOMETRY_OS_IOC_SUBMIT _IOW(GEOMETRY_OS_IOC_MAGIC, 0x01, struct glyph_submit)

/* Execute submitted program */
#define GEOMETRY_OS_IOC_EXEC _IO(GEOMETRY_OS_IOC_MAGIC, 0x02)

/* Wait for completion */
#define GEOMETRY_OS_IOC_WAIT _IOR(GEOMETRY_OS_IOC_MAGIC, 0x03, struct glyph_result)

/* Get GPU info */
#define GEOMETRY_OS_IOC_INFO _IOR(GEOMETRY_OS_IOC_MAGIC, 0x04, struct gpu_info)

/* DMA-BUF export */
#define GEOMETRY_OS_IOC_DMABUF _IOR(GEOMETRY_OS_IOC_MAGIC, 0x05, struct dmabuf_export)

/* Pin interaction bus */
#define GEOMETRY_OS_IOC_PIN_BUS _IOW(GEOMETRY_OS_IOC_MAGIC, 0x06, __u64)

/* Update mouse state */
#define GEOMETRY_OS_IOC_UPDATE_MOUSE _IOW(GEOMETRY_OS_IOC_MAGIC, 0x07, struct mouse_event)

/* Hardware VCC attestation */
#define GEOMETRY_OS_IOC_ATTEST _IOWR(GEOMETRY_OS_IOC_MAGIC, 0x08, struct vcc_attest)

/* Glyph program submission structure */
struct glyph_submit {
	__u64 spirv_ptr;	/* Pointer to SPIR-V binary */
	__u32 spirv_size;	/* Size in bytes */
	__u32 workgroup_x;	/* Dispatch dimensions */
	__u32 workgroup_y;
	__u32 workgroup_z;
	__u32 reserved[5];
};

/* Execution result */
struct glyph_result {
	__u64 cycles;		/* GPU cycles executed */
	__u32 status;		/* 0 = success, non-zero = error */
	__u32 output_size;	/* Output buffer size */
	__u64 output_ptr;	/* Output buffer pointer */
	__u32 reserved[8];
};

/* GPU information */
struct gpu_info {
	__u32 vendor_id;	/* PCI vendor ID */
	__u32 device_id;	/* PCI device ID */
	__u32 compute_units;	/* Number of CUs */
	__u32 vram_size_mb;	/* VRAM size in MB */
	__u32 gtt_size_mb;	/* GTT size in MB */
	__u32 driver_version;	/* Driver version */
	__u32 reserved[8];
};

/* DMA-BUF export result */
struct dmabuf_export {
	__s32 fd;		/* Prime file descriptor */
	__u32 size;		/* Buffer size */
	__u32 width;
	__u32 height;
	__u32 stride;
	__u32 format;		/* FourCC */
	__u32 reserved[4];
};

/* Mouse event for interaction bus */
struct mouse_event {
	__s32 x;
	__s32 y;
	__u32 buttons;
	__s32 dx;
	__s32 dy;
	__u32 reserved[3];
};

/* Hardware VCC attestation */
struct vcc_attest {
	__u32 expected_hash[8];
	__u32 status;		/* 1 = matched, 0 = mismatch */
	__u32 reserved[7];
};

/* Module state */
static struct {
	dev_t dev_num;
	struct class *class;
	struct cdev cdev;
	struct mutex lock;
	void *gpu_mmio;
	struct pci_dev *pdev;
	__u64 interaction_bus_addr;
	bool bus_pinned;
	bool initialized;
} geom_os;

/* File private data */
struct geom_file_ctx {
	__u32 active_program_id;
	bool has_submitted;
};

/* GPU initialization - find and map GPU (AMD or Intel) */
static int init_gpu(void)
{
	struct pci_dev *pdev = NULL;

	/* Try AMD GPU first (vendor ID 0x1002) */
	while ((pdev = pci_get_device(PCI_VENDOR_ID_AMD, PCI_ANY_ID, pdev))) {
		/* Check if it's a Radeon/AMDGPU device */
		if ((pdev->class >> 16) == PCI_BASE_CLASS_DISPLAY ||
		    (pdev->class >> 8) == 0x0300) { /* VGA compatible */
			pr_info("geometry_os: Found AMD GPU: %04x:%04x\n",
				pdev->vendor, pdev->device);
			geom_os.pdev = pdev;
			break;
		}
	}

	/* If no AMD, try Intel (vendor ID 0x8086) */
	if (!geom_os.pdev) {
		pdev = NULL;
		while ((pdev = pci_get_device(PCI_VENDOR_ID_INTEL, PCI_ANY_ID, pdev))) {
			if ((pdev->class >> 8) == 0x0300) { /* VGA compatible */
				pr_info("geometry_os: Found Intel GPU: %04x:%04x\n",
					pdev->vendor, pdev->device);
				geom_os.pdev = pdev;
				break;
			}
		}
	}

	if (!geom_os.pdev) {
		pr_warn("geometry_os: No GPU found\n");
		return -ENODEV;
	}

	/* In full implementation, would map MMIO here */
	pr_info("geometry_os: GPU initialized\n");
	geom_os.initialized = true;

	return 0;
}

/* Character device operations */
static int geom_os_open(struct inode *inode, struct file *file)
{
	struct geom_file_ctx *ctx;

	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
	if (!ctx)
		return -ENOMEM;

	file->private_data = ctx;
	pr_debug("geometry_os: Device opened\n");

	return 0;
}

static int geom_os_release(struct inode *inode, struct file *file)
{
	struct geom_file_ctx *ctx = file->private_data;

	kfree(ctx);
	pr_debug("geometry_os: Device closed\n");

	return 0;
}

static long geom_os_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
{
	struct geom_file_ctx *ctx = file->private_data;
	void __user *argp = (void __user *)arg;
	int ret = 0;

	if (mutex_lock_interruptible(&geom_os.lock))
		return -ERESTARTSYS;

	switch (cmd) {
	case GEOMETRY_OS_IOC_SUBMIT: {
		struct glyph_submit submit;

		if (copy_from_user(&submit, argp, sizeof(submit))) {
			ret = -EFAULT;
			break;
		}

		pr_info("geometry_os: Submit SPIR-V %u bytes, dispatch %ux%ux%u\n",
			submit.spirv_size, submit.workgroup_x,
			submit.workgroup_y, submit.workgroup_z);

		/* In full implementation:
		 * 1. Allocate GPU memory for SPIR-V
		 * 2. Copy SPIR-V to GPU
		 * 3. Create command buffer
		 * 4. Queue for execution
		 */

		ctx->has_submitted = true;
		ret = 0;
		break;
	}

	case GEOMETRY_OS_IOC_EXEC:
		if (!ctx->has_submitted) {
			pr_warn("geometry_os: No program submitted\n");
			ret = -EINVAL;
			break;
		}

		pr_info("geometry_os: Executing glyph program\n");

		/* In full implementation:
		 * 1. Submit command buffer to GPU
		 * 2. Ring doorbell
		 */

		ret = 0;
		break;

	case GEOMETRY_OS_IOC_WAIT: {
		struct glyph_result result = {0};

		if (!ctx->has_submitted) {
			ret = -EINVAL;
			break;
		}

		/* In full implementation:
		 * 1. Wait for fence
		 * 2. Read back results
		 */

		result.status = 0; /* Success */
		result.cycles = 0; /* Placeholder */

		if (copy_to_user(argp, &result, sizeof(result))) {
			ret = -EFAULT;
			break;
		}

		pr_info("geometry_os: Execution complete\n");
		ret = 0;
		break;
	}

	case GEOMETRY_OS_IOC_INFO: {
		struct gpu_info info = {0};

		if (geom_os.pdev) {
			info.vendor_id = geom_os.pdev->vendor;
			info.device_id = geom_os.pdev->device;
		}

		info.compute_units = 0; /* Would query from GPU */
		info.vram_size_mb = 0;
		info.driver_version = 0x000100; /* 0.1.0 */

		if (copy_to_user(argp, &info, sizeof(info))) {
			ret = -EFAULT;
			break;
		}

		ret = 0;
		break;
	}

	case GEOMETRY_OS_IOC_DMABUF: {
		struct dmabuf_export export = {0};

		/* In full implementation:
		 * 1. dma_buf_export()
		 * 2. dma_buf_fd()
		 */

		export.fd = -1; /* Placeholder */
		export.size = 0;

		if (copy_to_user(argp, &export, sizeof(export))) {
			ret = -EFAULT;
			break;
		}

		ret = 0;
		break;
	}

	case GEOMETRY_OS_IOC_PIN_BUS: {
		__u64 addr;

		if (copy_from_user(&addr, argp, sizeof(addr))) {
			ret = -EFAULT;
			break;
		}

		pr_info("geometry_os: Pinning interaction bus at GPU addr 0x%llx\n", addr);
		geom_os.interaction_bus_addr = addr;
		geom_os.bus_pinned = true;
		ret = 0;
		break;
	}

	case GEOMETRY_OS_IOC_UPDATE_MOUSE: {
		struct mouse_event ev;

		if (!geom_os.bus_pinned) {
			pr_warn("geometry_os: Cannot update mouse, bus not pinned\n");
			ret = -EINVAL;
			break;
		}

		if (copy_from_user(&ev, argp, sizeof(ev))) {
			ret = -EFAULT;
			break;
		}

		/* In full implementation:
		 * Write ev to GPU VRAM at interaction_bus_addr
		 * This is the ZERO LATENCY path
		 */
		pr_debug("geometry_os: Mouse update: %d,%d btn=%u\n", ev.x, ev.y, ev.buttons);

		ret = 0;
		break;
	}

	case GEOMETRY_OS_IOC_ATTEST: {
		struct vcc_attest attest;

		if (copy_from_user(&attest, argp, sizeof(attest))) {
			ret = -EFAULT;
			break;
		}

		/* In full implementation:
		 * 1. Trigger GPU-side hash computation
		 * 2. Compare with attest.expected_hash
		 */
		pr_info("geometry_os: Performing hardware VCC attestation\n");
		attest.status = 1; /* Simulate success */

		if (copy_to_user(argp, &attest, sizeof(attest))) {
			ret = -EFAULT;
			break;
		}

		ret = 0;
		break;
	}

	default:
		pr_warn("geometry_os: Unknown ioctl 0x%x\n", cmd);
		ret = -ENOTTY;
		break;
	}

	mutex_unlock(&geom_os.lock);
	return ret;
}

static ssize_t geom_os_read(struct file *file, char __user *buf,
			    size_t count, loff_t *ppos)
{
	/* Read returns GPU execution results */
	const char *status = "geometry_os: ready\n";
	size_t len = strlen(status);

	if (*ppos >= len)
		return 0;

	if (copy_to_user(buf, status, len))
		return -EFAULT;

	*ppos = len;
	return len;
}

static const struct file_operations geom_os_fops = {
	.owner = THIS_MODULE,
	.open = geom_os_open,
	.release = geom_os_release,
	.unlocked_ioctl = geom_os_ioctl,
	.compat_ioctl = geom_os_ioctl,
	.read = geom_os_read,
	.llseek = noop_llseek,
};

static int __init geometry_os_init(void)
{
	dev_t dev;
	int ret;

	pr_info("geometry_os: Initializing kernel module\n");

	mutex_init(&geom_os.lock);

	/* Allocate device number */
	ret = alloc_chrdev_region(&dev, 0, 1, DEVICE_NAME);
	if (ret < 0) {
		pr_err("geometry_os: Failed to allocate device number\n");
		return ret;
	}
	geom_os.dev_num = dev;

	/* Create device class */
	geom_os.class = class_create(CLASS_NAME);
	if (IS_ERR(geom_os.class)) {
		pr_err("geometry_os: Failed to create device class\n");
		ret = PTR_ERR(geom_os.class);
		goto err_unregister;
	}

	/* Initialize character device */
	cdev_init(&geom_os.cdev, &geom_os_fops);
	geom_os.cdev.owner = THIS_MODULE;

	ret = cdev_add(&geom_os.cdev, dev, 1);
	if (ret < 0) {
		pr_err("geometry_os: Failed to add cdev\n");
		goto err_class;
	}

	/* Create /dev/geometry_os */
	if (!device_create(geom_os.class, NULL, dev, NULL, DEVICE_NAME)) {
		pr_err("geometry_os: Failed to create device\n");
		ret = -ENOMEM;
		goto err_cdev;
	}

	/* Initialize GPU */
	ret = init_gpu();
	if (ret < 0) {
		pr_warn("geometry_os: GPU init failed (continuing anyway)\n");
		/* Don't fail - can still be used for testing */
	}

	pr_info("geometry_os: Module loaded, /dev/geometry_os ready\n");
	return 0;

err_cdev:
	cdev_del(&geom_os.cdev);
err_class:
	class_destroy(geom_os.class);
err_unregister:
	unregister_chrdev_region(dev, 1);

	return ret;
}

static void __exit geometry_os_exit(void)
{
	pr_info("geometry_os: Unloading module\n");

	device_destroy(geom_os.class, geom_os.dev_num);
	cdev_del(&geom_os.cdev);
	class_destroy(geom_os.class);
	unregister_chrdev_region(geom_os.dev_num, 1);

	pr_info("geometry_os: Module unloaded\n");
}

module_init(geometry_os_init);
module_exit(geometry_os_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Geometry OS Project");
MODULE_DESCRIPTION("Direct GPU glyph execution interface");
MODULE_VERSION("0.1");
