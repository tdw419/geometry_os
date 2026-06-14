/*
 * palace.c — /dev/palace Memory Palace Pixel Buffer Driver
 *
 * Exposes a 256KB pixel buffer as a character device with mmap support.
 * GeoOS maps this buffer directly, eliminating the Python FUSE socket bridge.
 *
 * The buffer doubles as:
 *   - A display framebuffer (pixels = display)
 *   - A block storage device (pixels = storage)
 *   - A compute scratch space (pixels = compute)
 *
 * Build: make (part of geometry_os kernel module tree)
 * Load:  sudo insmod palace.ko
 * Test:  sudo chmod 666 /dev/palace
 */

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/fs.h>
#include <linux/mm.h>
#include <linux/slab.h>
#include <linux/uaccess.h>
#include <linux/io.h>
#include <linux/cdev.h>
#include <linux/device.h>

#define DEVICE_NAME "palace"
#define CLASS_NAME  "palace"
#define PALACE_BUF_SIZE (256 * 1024)  /* 256 KB = 256x256 RGBA pixels */

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Geometry OS");
MODULE_DESCRIPTION("/dev/palace Shared Memory Pixel Buffer Driver");
MODULE_VERSION("1.0");

/* Driver state */
static int major_num;
static struct class *palace_class = NULL;
static struct device *palace_device = NULL;
static DEFINE_MUTEX(palace_mutex);
static void *palace_buffer = NULL;
static int palace_used = 0;

/* ---- File operations ---- */

static int palace_open(struct inode *inodep, struct file *filep)
{
    mutex_lock(&palace_mutex);
    palace_used++;
    mutex_unlock(&palace_mutex);
    return 0;
}

static int palace_release(struct inode *inodep, struct file *filep)
{
    mutex_lock(&palace_mutex);
    palace_used--;
    mutex_unlock(&palace_mutex);
    return 0;
}

static int palace_mmap(struct file *filep, struct vm_area_struct *vma)
{
    unsigned long size = vma->vm_end - vma->vm_start;
    unsigned long pfn;
    unsigned long offset;

    if (size > PALACE_BUF_SIZE)
        return -EINVAL;

    /* We use physically contiguous pages (order-6 = 64 pages = 256KB) */
    pfn = virt_to_phys(palace_buffer) >> PAGE_SHIFT;
    offset = vma->vm_pgoff << PAGE_SHIFT;

    if (offset + size > PALACE_BUF_SIZE)
        return -EINVAL;

    /* Mark as uncacheable so writes are immediately visible */
    vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);

    if (remap_pfn_range(vma, vma->vm_start,
                        pfn + (offset >> PAGE_SHIFT),
                        size, vma->vm_page_prot))
        return -EAGAIN;

    return 0;
}

static ssize_t palace_read(struct file *filep, char __user *buf,
                           size_t count, loff_t *f_pos)
{
    size_t available = PALACE_BUF_SIZE - (size_t)*f_pos;

    if (count > available)
        count = available;
    if (count == 0)
        return 0;

    if (copy_to_user(buf, palace_buffer + *f_pos, count))
        return -EFAULT;

    *f_pos += count;
    return count;
}

static ssize_t palace_write(struct file *filep, const char __user *buf,
                            size_t count, loff_t *f_pos)
{
    size_t available = PALACE_BUF_SIZE - (size_t)*f_pos;

    if (count > available)
        count = available;
    if (count == 0)
        return 0;

    if (copy_from_user(palace_buffer + *f_pos, buf, count))
        return -EFAULT;

    *f_pos += count;
    return count;
}

static loff_t palace_llseek(struct file *filep, loff_t offset, int whence)
{
    loff_t new_pos;

    switch (whence) {
    case SEEK_SET:
        new_pos = offset;
        break;
    case SEEK_CUR:
        new_pos = filep->f_pos + offset;
        break;
    case SEEK_END:
        new_pos = PALACE_BUF_SIZE + offset;
        break;
    default:
        return -EINVAL;
    }

    if (new_pos < 0 || new_pos > PALACE_BUF_SIZE)
        return -EINVAL;

    filep->f_pos = new_pos;
    return new_pos;
}

static struct file_operations palace_fops = {
    .owner   = THIS_MODULE,
    .open    = palace_open,
    .release = palace_release,
    .mmap    = palace_mmap,
    .read    = palace_read,
    .write   = palace_write,
    .llseek  = palace_llseek,
};

/* ---- Module init/exit ---- */

static int __init palace_init(void)
{
    pr_info("palace: initializing /dev/palace (%d KB pixel buffer)\n",
            PALACE_BUF_SIZE / 1024);

    /* Allocate physically contiguous memory */
    palace_buffer = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO,
                                              get_order(PALACE_BUF_SIZE));
    if (!palace_buffer) {
        pr_err("palace: failed to allocate %d bytes\n", PALACE_BUF_SIZE);
        return -ENOMEM;
    }

    /* Register character device */
    major_num = register_chrdev(0, DEVICE_NAME, &palace_fops);
    if (major_num < 0) {
        pr_err("palace: failed to register char device\n");
        free_pages((unsigned long)palace_buffer, get_order(PALACE_BUF_SIZE));
        return major_num;
    }

    /* Create device class */
    palace_class = class_create(CLASS_NAME);
    if (IS_ERR(palace_class)) {
        pr_err("palace: failed to create class\n");
        unregister_chrdev(major_num, DEVICE_NAME);
        free_pages((unsigned long)palace_buffer, get_order(PALACE_BUF_SIZE));
        return PTR_ERR(palace_class);
    }

    /* Create device node */
    palace_device = device_create(palace_class, NULL,
                                  MKDEV(major_num, 0), NULL,
                                  DEVICE_NAME);
    if (IS_ERR(palace_device)) {
        pr_err("palace: failed to create device\n");
        class_destroy(palace_class);
        unregister_chrdev(major_num, DEVICE_NAME);
        free_pages((unsigned long)palace_buffer, get_order(PALACE_BUF_SIZE));
        return PTR_ERR(palace_device);
    }

    pr_info("palace: registered with major=%d\n", major_num);
    phys_addr_t phys = virt_to_phys(palace_buffer);
    pr_info("palace: buffer at phys=0x%pa virt=%p\n",
            &phys, palace_buffer);

    return 0;
}

static void __exit palace_exit(void)
{
    device_destroy(palace_class, MKDEV(major_num, 0));
    class_destroy(palace_class);
    unregister_chrdev(major_num, DEVICE_NAME);

    if (palace_buffer) {
        free_pages((unsigned long)palace_buffer, get_order(PALACE_BUF_SIZE));
        palace_buffer = NULL;
    }

    pr_info("palace: unloaded\n");
}

module_init(palace_init);
module_exit(palace_exit);
