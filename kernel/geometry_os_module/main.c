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

static const struct file_operations geos_fops = {
    .owner = THIS_MODULE,
    .open = geos_open,
    .release = geos_release,
};

/* Misc device definition */
static struct miscdevice geos_misc = {
    .minor = MISC_DYNAMIC_MINOR,
    .name = GEOS_DEVICE_NAME,
    .fops = &geos_fops,
    .mode = 0666,
};

static int __init geometry_os_init(void)
{
    int ret;

    pr_info("geometry_os: module loading\n");

    ret = misc_register(&geos_misc);
    if (ret) {
        pr_err("geometry_os: failed to register misc device\n");
        return ret;
    }

    pr_info("geometry_os: registered /dev/%s\n", GEOS_DEVICE_NAME);
    return 0;
}

static void __exit geometry_os_exit(void)
{
    misc_deregister(&geos_misc);
    pr_info("geometry_os: module unloading\n");
}

module_init(geometry_os_init);
module_exit(geometry_os_exit);
