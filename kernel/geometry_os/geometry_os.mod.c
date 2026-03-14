#include <linux/module.h>
#include <linux/export-internal.h>
#include <linux/compiler.h>

MODULE_INFO(name, KBUILD_MODNAME);

__visible struct module __this_module
__section(".gnu.linkonce.this_module") = {
	.name = KBUILD_MODNAME,
	.init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
	.exit = cleanup_module,
#endif
	.arch = MODULE_ARCH_INIT,
};



static const struct modversion_info ____versions[]
__used __section("__versions") = {
	{ 0x9f222e1e, "alloc_chrdev_region" },
	{ 0x092a35a2, "_copy_from_user" },
	{ 0xd3d9cc91, "pci_get_device" },
	{ 0x962cecbf, "class_destroy" },
	{ 0xcb8b6ec6, "kfree" },
	{ 0xd272d446, "__fentry__" },
	{ 0xe8213e80, "_printk" },
	{ 0xbd03ed67, "__ref_stack_chk_guard" },
	{ 0xd272d446, "__stack_chk_fail" },
	{ 0xfaadbd72, "cdev_add" },
	{ 0x01f403fc, "device_create" },
	{ 0x0232ea06, "noop_llseek" },
	{ 0xb3d7f998, "class_create" },
	{ 0xbd03ed67, "random_kmalloc_seed" },
	{ 0xc1e6c71e, "__mutex_init" },
	{ 0x357aaab3, "mutex_lock_interruptible" },
	{ 0xd272d446, "__x86_return_thunk" },
	{ 0x092a35a2, "_copy_to_user" },
	{ 0x0bc5fb0d, "unregister_chrdev_region" },
	{ 0xf46d5bf3, "mutex_unlock" },
	{ 0x3124a198, "device_destroy" },
	{ 0x23f25c0a, "__dynamic_pr_debug" },
	{ 0x957c6137, "__kmalloc_cache_noprof" },
	{ 0xe4de56b4, "__ubsan_handle_load_invalid_value" },
	{ 0xbbb26ca8, "cdev_init" },
	{ 0x78339609, "kmalloc_caches" },
	{ 0x881f0858, "cdev_del" },
	{ 0x984622ae, "module_layout" },
};

static const u32 ____version_ext_crcs[]
__used __section("__version_ext_crcs") = {
	0x9f222e1e,
	0x092a35a2,
	0xd3d9cc91,
	0x962cecbf,
	0xcb8b6ec6,
	0xd272d446,
	0xe8213e80,
	0xbd03ed67,
	0xd272d446,
	0xfaadbd72,
	0x01f403fc,
	0x0232ea06,
	0xb3d7f998,
	0xbd03ed67,
	0xc1e6c71e,
	0x357aaab3,
	0xd272d446,
	0x092a35a2,
	0x0bc5fb0d,
	0xf46d5bf3,
	0x3124a198,
	0x23f25c0a,
	0x957c6137,
	0xe4de56b4,
	0xbbb26ca8,
	0x78339609,
	0x881f0858,
	0x984622ae,
};
static const char ____version_ext_names[]
__used __section("__version_ext_names") =
	"alloc_chrdev_region\0"
	"_copy_from_user\0"
	"pci_get_device\0"
	"class_destroy\0"
	"kfree\0"
	"__fentry__\0"
	"_printk\0"
	"__ref_stack_chk_guard\0"
	"__stack_chk_fail\0"
	"cdev_add\0"
	"device_create\0"
	"noop_llseek\0"
	"class_create\0"
	"random_kmalloc_seed\0"
	"__mutex_init\0"
	"mutex_lock_interruptible\0"
	"__x86_return_thunk\0"
	"_copy_to_user\0"
	"unregister_chrdev_region\0"
	"mutex_unlock\0"
	"device_destroy\0"
	"__dynamic_pr_debug\0"
	"__kmalloc_cache_noprof\0"
	"__ubsan_handle_load_invalid_value\0"
	"cdev_init\0"
	"kmalloc_caches\0"
	"cdev_del\0"
	"module_layout\0"
;

MODULE_INFO(depends, "");


MODULE_INFO(srcversion, "C9E0921E04C89AB5D92CB1F");
