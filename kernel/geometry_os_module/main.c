// kernel/geometry_os_module/main.c
/*
 * Geometry OS Kernel Module
 *
 * Exposes glyph execution via /dev/geometry_os
 */

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/miscdevice.h>
#include <linux/fs.h>
#include <linux/uaccess.h>
#include <linux/slab.h>
#include <linux/mutex.h>

#include "geometry_os.h"
#include "gpu.h"
#include "uapi/geometry_os.h"

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Geometry OS");
MODULE_DESCRIPTION("Glyph execution kernel module");
MODULE_VERSION("0.1");

/* SPIR-V storage (simplified - single program) */
#define MAX_SPIRV_SIZE (64 * 1024)  /* 64KB max */

static DEFINE_MUTEX(geos_spirv_mutex);
static void *spirv_buffer;
static size_t spirv_size;

/* Uniforms storage */
static struct geos_uniforms geos_uniforms;

static long geos_ioctl_load_spirv(unsigned long arg)
{
    struct geos_spirv_load load;
    void __user *uptr;
    u32 magic;
    int ret = 0;

    mutex_lock(&geos_spirv_mutex);

    if (copy_from_user(&load, (void __user *)arg, sizeof(load))) {
        ret = -EFAULT;
        goto out;
    }

    if (load.spirv_size > MAX_SPIRV_SIZE) {
        ret = -EFBIG;
        goto out;
    }

    if (load.spirv_size < 20) {  /* Minimum SPIR-V header size */
        ret = -EINVAL;
        goto out;
    }

    uptr = (void __user *)load.spirv_ptr;
    if (!uptr) {
        ret = -EINVAL;
        goto out;
    }

    /* Allocate buffer if needed */
    if (!spirv_buffer) {
        spirv_buffer = kmalloc(MAX_SPIRV_SIZE, GFP_KERNEL);
        if (!spirv_buffer) {
            ret = -ENOMEM;
            goto out;
        }
    }

    /* Copy SPIR-V from userspace */
    if (copy_from_user(spirv_buffer, uptr, load.spirv_size)) {
        spirv_size = 0;  /* Reset on error */
        ret = -EFAULT;
        goto out;
    }

    /* Validate SPIR-V magic number */
    magic = *(u32 *)spirv_buffer;
    if (magic != 0x07230203) {
        pr_warn("geometry_os: Invalid SPIR-V magic: 0x%08x\n", magic);
        spirv_size = 0;  /* Reset on error */
        ret = -EINVAL;
        goto out;
    }

    spirv_size = load.spirv_size;
    pr_info("geometry_os: Loaded %zu byte SPIR-V binary\n", spirv_size);

out:
    mutex_unlock(&geos_spirv_mutex);
    return ret;
}

static long geos_ioctl_set_uniforms(unsigned long arg)
{
    if (copy_from_user(&geos_uniforms, (void __user *)arg, sizeof(geos_uniforms)))
        return -EFAULT;

    pr_debug("geometry_os: Uniforms set: %ux%u time=%u\n",
             geos_uniforms.width, geos_uniforms.height, geos_uniforms.time);

    return 0;
}

static long geos_ioctl_get_output(unsigned long arg)
{
    /* Stub: return -ENOSYS until DMA-BUF is implemented */
    pr_info("geometry_os: GET_OUTPUT called (not implemented)\n");
    return -ENOSYS;
}

/* File operations */
static int geos_open(struct inode *inode, struct file *file)
{
    pr_info("geometry_os: device opened\n");
    return 0;
}

static int geos_release(struct inode *inode, struct file *file)
{
    pr_info("geometry_os: device closed\n");
    return 0;
}

static long geos_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
{
    switch (cmd) {
    case GEOS_IOCTL_LOAD_SPIRV:
        return geos_ioctl_load_spirv(arg);

    case GEOS_IOCTL_EXECUTE:
        pr_info("geometry_os: EXECUTE ioctl\n");
        return -ENOSYS;

    case GEOS_IOCTL_SET_UNIFORMS:
        return geos_ioctl_set_uniforms(arg);

    case GEOS_IOCTL_GET_OUTPUT:
        return geos_ioctl_get_output(arg);

    default:
        return -ENOTTY;
    }
}

static const struct file_operations geos_fops = {
    .owner = THIS_MODULE,
    .open = geos_open,
    .release = geos_release,
    .unlocked_ioctl = geos_ioctl,
};

/* Misc device definition */
static struct miscdevice geos_misc = {
    .minor = MISC_DYNAMIC_MINOR,
    .name = GEOS_DEVICE_NAME,
    .fops = &geos_fops,
    .mode = 0666,
};

/* Global GPU state */
static struct geos_gpu geos_gpu;

struct geos_gpu *geos_gpu_global;

static int __init geometry_os_init(void)
{
    int ret;

    pr_info("geometry_os: module loading\n");

    /* Initialize GPU */
    ret = geos_gpu_init(&geos_gpu);
    if (ret) {
        pr_warn("geometry_os: GPU init failed, running in stub mode\n");
        /* Continue anyway for testing */
    }
    geos_gpu_global = &geos_gpu;

    /* Register misc device */
    ret = misc_register(&geos_misc);
    if (ret) {
        pr_err("geometry_os: failed to register misc device\n");
        geos_gpu_fini(&geos_gpu);
        return ret;
    }

    pr_info("geometry_os: registered /dev/%s\n", GEOS_DEVICE_NAME);
    return 0;
}

static void __exit geometry_os_exit(void)
{
    misc_deregister(&geos_misc);
    geos_gpu_fini(&geos_gpu);
    kfree(spirv_buffer);
    spirv_buffer = NULL;
    pr_info("geometry_os: module unloading\n");
}

module_init(geometry_os_init);
module_exit(geometry_os_exit);
