/* kernel/geometry_os_module/uapi/geometry_os.h */
#ifndef _UAPI_GEOMETRY_OS_H
#define _UAPI_GEOMETRY_OS_H

#include <linux/ioctl.h>
#include <linux/types.h>

/* Ioctl command codes */
#define GEOS_MAGIC 'G'

#define GEOS_IOCTL_LOAD_SPIRV    _IOW(GEOS_MAGIC, 0x01, struct geos_spirv_load)
#define GEOS_IOCTL_EXECUTE       _IOW(GEOS_MAGIC, 0x02, struct geos_execute)
#define GEOS_IOCTL_GET_OUTPUT    _IOR(GEOS_MAGIC, 0x03, int)
#define GEOS_IOCTL_SET_UNIFORMS  _IOW(GEOS_MAGIC, 0x04, struct geos_uniforms)

/* Data structures for ioctl */
struct geos_spirv_load {
    __u64 spirv_ptr;     /* Pointer to SPIR-V binary */
    __u32 spirv_size;    /* Size in bytes */
    __u32 padding;
};

struct geos_execute {
    __u32 width;          /* Output width */
    __u32 height;         /* Output height */
    __u64 input_ptr;      /* Input buffer (or 0) */
    __u32 input_size;     /* Input size in bytes */
    __u32 padding;
};

struct geos_uniforms {
    __u32 width;
    __u32 height;
    __float time;
    __float padding;
};

#endif /* _UAPI_GEOMETRY_OS_H */
