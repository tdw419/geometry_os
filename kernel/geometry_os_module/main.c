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

#include "geometry_os.h"
#include "gpu.h"
#include "uapi/geometry_os.h"

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Geometry OS");
MODULE_DESCRIPTION("Glyph execution kernel module");
MODULE_VERSION("0.1");

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
        pr_info("geometry_os: LOAD_SPIRV ioctl\n");
        return -ENOSYS;  /* Not implemented yet */

    case GEOS_IOCTL_EXECUTE:
        pr_info("geometry_os: EXECUTE ioctl\n");
        return -ENOSYS;

    case GEOS_IOCTL_GET_OUTPUT:
        pr_info("geometry_os: GET_OUTPUT ioctl\n");
        return -ENOSYS;

    case GEOS_IOCTL_SET_UNIFORMS:
        pr_info("geometry_os: SET_UNIFORMS ioctl\n");
        return -ENOSYS;

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
    pr_info("geometry_os: module unloading\n");
}

module_init(geometry_os_init);
module_exit(geometry_os_exit);
