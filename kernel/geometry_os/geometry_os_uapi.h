/*
 * Geometry OS User API - Userspace interface definitions
 *
 * Include this header in userspace programs that interact with
 * /dev/geometry_os
 */

#ifndef _GEOMETRY_OS_UAPI_H
#define _GEOMETRY_OS_UAPI_H

#include <linux/ioctl.h>
#include <linux/types.h>

/* IOCTL magic number */
#define GEOMETRY_OS_IOC_MAGIC 'G'

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

/* IOCTL commands */
#define GEOMETRY_OS_IOC_SUBMIT _IOW(GEOMETRY_OS_IOC_MAGIC, 0x01, struct glyph_submit)
#define GEOMETRY_OS_IOC_EXEC _IO(GEOMETRY_OS_IOC_MAGIC, 0x02)
#define GEOMETRY_OS_IOC_WAIT _IOR(GEOMETRY_OS_IOC_MAGIC, 0x03, struct glyph_result)
#define GEOMETRY_OS_IOC_INFO _IOR(GEOMETRY_OS_IOC_MAGIC, 0x04, struct gpu_info)
#define GEOMETRY_OS_IOC_DMABUF _IOR(GEOMETRY_OS_IOC_MAGIC, 0x05, struct dmabuf_export)
#define GEOMETRY_OS_IOC_PIN_BUS _IOW(GEOMETRY_OS_IOC_MAGIC, 0x06, __u64)
#define GEOMETRY_OS_IOC_UPDATE_MOUSE _IOW(GEOMETRY_OS_IOC_MAGIC, 0x07, struct mouse_event)
#define GEOMETRY_OS_IOC_ATTEST _IOWR(GEOMETRY_OS_IOC_MAGIC, 0x08, struct vcc_attest)

#endif /* _GEOMETRY_OS_UAPI_H */
