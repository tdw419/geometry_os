/*
 * Geometry OS UEFI Bootloader
 *
 * Phase 4: Bare metal boot without Linux
 * - UEFI application that initializes GPU from PCI
 * - Loads Geometry OS kernel
 * - Sets up glyph substrate memory
 */

#include <efi.h>
#include <efilib.h>
#include <efipciio.h>
#include <efidevp.h>

/* GPU vendor/device IDs */
#define AMD_VENDOR_ID  0x1002
#define AMD_NAVI10_DEV  0x7310
#define AMD_NAVI21_DEV  0x73BF
#define AMD_NAVI22_DEV  0x73DF

/* Geometry OS kernel entry point */
typedef void (*kernel_entry_t)(void *gpu_mmio, void *glyph_memory);

/* Boot information passed to kernel */
struct geometry_os_boot_info {
	UINT64 magic;			/* 0x47454F535F52 ("GEOSR") */
	UINT64 gpu_mmio_base;		/* GPU register base */
	UINT64 gpu_mmio_size;
	UINT64 vram_base;		/* VRAM physical address */
	UINT64 vram_size;
	UINT64 glyph_memory_base;	/* Glyph substrate memory */
	UINT64 glyph_memory_size;
	UINT32 gpu_vendor_id;
	UINT32 gpu_device_id;
	UINT32 num_compute_units;
	UINT64 init_glyph_base;		/* Address of loaded window_manager.rts.png */
	UINT64 init_glyph_size;		/* Size of loaded glyph program */
	UINT64 guest_os_base;		/* Address of loaded ubuntu_native.rts.png */
	UINT64 guest_os_size;
	UINT64 microcode_base;		/* Address of glyph_microcode.spv */
	UINT64 microcode_size;		/* Size of microcode */
	/* AMD Firmware Textures */
	UINT64 fw_pfp_base;
	UINT64 fw_me_base;
	UINT64 fw_ce_base;
	UINT64 fw_mec_base;
	UINT64 fw_rlc_base;
	UINT8  reserved[20];
};

static EFI_HANDLE ImageHandle;
static EFI_SYSTEM_TABLE *SystemTable;

/* Load a file from the boot partition */
static EFI_STATUS load_file(EFI_HANDLE Image, const CHAR16 *Path, void **Buffer, UINT64 *Size)
{
	EFI_STATUS Status;
	EFI_LOADED_IMAGE_PROTOCOL *LoadedImage;
	EFI_SIMPLE_FILE_SYSTEM_PROTOCOL *FileSystem;
	EFI_FILE_PROTOCOL *Root, *File;
	UINTN FileSize;
	void *Data;

	/* Get boot device */
	Status = gBS->HandleProtocol(
		Image,
		&gEfiLoadedImageProtocolGuid,
		(void **)&LoadedImage
	);

	if (EFI_ERROR(Status)) {
		return Status;
	}

	/* Open filesystem */
	Status = gBS->HandleProtocol(
		LoadedImage->DeviceHandle,
		&gEfiSimpleFileSystemProtocolGuid,
		(void **)&FileSystem
	);

	if (EFI_ERROR(Status)) {
		return Status;
	}

	Status = FileSystem->OpenVolume(FileSystem, &Root);
	if (EFI_ERROR(Status)) {
		return Status;
	}

	/* Open file */
	Status = Root->Open(
		Root,
		&File,
		(CHAR16 *)Path,
		EFI_FILE_MODE_READ,
		0
	);

	if (EFI_ERROR(Status)) {
		return Status;
	}

	/* Get file size */
	UINT64 FileInfoSize = 0;
	EFI_FILE_INFO *FileInfo = NULL;

	Status = File->GetInfo(File, &gEfiFileInfoGuid, &FileInfoSize, NULL);
	if (Status == EFI_BUFFER_TOO_SMALL) {
		gBS->AllocatePool(EfiBootServicesData, FileInfoSize, (void **)&FileInfo);
		File->GetInfo(File, &gEfiFileInfoGuid, &FileInfoSize, FileInfo);
	}

	FileSize = FileInfo->FileSize;
	gBS->FreePool(FileInfo);

	/* Allocate memory for file */
	Status = gBS->AllocatePool(EfiLoaderData, FileSize, &Data);
	if (EFI_ERROR(Status)) {
		Print(L"Failed to allocate memory for %s\r\n", Path);
		return Status;
	}

	/* Read file */
	Status = File->Read(File, &FileSize, Data);
	if (EFI_ERROR(Status)) {
		Print(L"Failed to read %s\r\n", Path);
		return Status;
	}

	*Buffer = Data;
	*Size = FileSize;

	Print(L"Loaded %s: %lu bytes at 0x%lx\r\n", Path, FileSize, (UINT64)Data);

	File->Close(File);
	Root->Close(Root);

	return EFI_SUCCESS;
}

/* Load the initial glyph program (window_manager.rts.png) */
static EFI_STATUS load_init_glyph(EFI_HANDLE Image, void **GlyphBase, UINT64 *GlyphSize)
{
	EFI_STATUS Status = load_file(Image, L"\\window_manager.rts.png", GlyphBase, GlyphSize);
	if (EFI_ERROR(Status)) {
		Print(L"window_manager.rts.png not found - optional component\r\n");
		*GlyphBase = 0;
		*GlyphSize = 0;
		return EFI_SUCCESS;
	}
	return Status;
}

/* Load the glyph microcode (glyph_microcode.spv) */
static EFI_STATUS load_microcode(EFI_HANDLE Image, void **MicrocodeBase, UINT64 *MicrocodeSize)
{
	EFI_STATUS Status = load_file(Image, L"\\glyph_microcode.spv", MicrocodeBase, MicrocodeSize);
	if (EFI_ERROR(Status)) {
		Print(L"glyph_microcode.spv not found - required for execution\r\n");
		*MicrocodeBase = 0;
		*MicrocodeSize = 0;
		return Status;
	}
	return Status;
}

/* Find AMD GPU on PCI bus */
static EFI_STATUS find_gpu(EFI_PCI_IO_PROTOCOL **PciIo, UINT64 *MmioBase)
{
	EFI_STATUS Status;
	UINTN HandleCount;
	EFI_HANDLE *Handles;
	UINTN Index;

	Status = gBS->LocateHandleBuffer(
		ByProtocol,
		&gEfiPciIoProtocolGuid,
		NULL,
		&HandleCount,
		&Handles
	);

	if (EFI_ERROR(Status)) {
		Print(L"Failed to find PCI devices\r\n");
		return Status;
	}

	Print(L"Scanning PCI bus for AMD GPU...\r\n");

	for (Index = 0; Index < HandleCount; Index++) {
		EFI_PCI_IO_PROTOCOL *Io;
		PCI_TYPE00 PciHeader;

		Status = gBS->HandleProtocol(
			Handles[Index],
			&gEfiPciIoProtocolGuid,
			(void **)&Io
		);

		if (EFI_ERROR(Status))
			continue;

		Status = Io->Pci.Read(
			Io,
			EfiPciIoWidthUint32,
			0,
			sizeof(PciHeader) / sizeof(UINT32),
			&PciHeader
		);

		if (EFI_ERROR(Status))
			continue;

		/* Check for AMD GPU */
		if (PciHeader.Hdr.VendorId == AMD_VENDOR_ID) {
			UINT8 ClassCode;

			Io->Pci.Read(Io, EfiPciIoWidthUint8, 0x0B, 1, &ClassCode);

			if (ClassCode == 0x03) { /* Display controller */
				Print(L"Found AMD GPU: %04X:%04X\r\n",
					PciHeader.Hdr.VendorId,
					PciHeader.Hdr.DeviceId);

				/* Get BAR0 (MMIO) */
				UINT64 Bar0;
				Status = Io->Pci.Read(
					Io,
					EfiPciIoWidthUint32,
					0x10, /* BAR0 offset */
					1,
					&Bar0
				);

				if (!EFI_ERROR(Status)) {
					*MmioBase = Bar0 & ~0xF;
					*PciIo = Io;

					gBS->FreePool(Handles);
					return EFI_SUCCESS;
				}
			}
		}
	}

	gBS->FreePool(Handles);
	Print(L"No AMD GPU found\r\n");
	return EFI_NOT_FOUND;
}

/* Map GPU MMIO region */
static EFI_STATUS map_gpu_mmio(EFI_PCI_IO_PROTOCOL *PciIo, UINT64 *MappedBase)
{
	EFI_STATUS Status;
	UINT64 MmioBase;
	UINT64 MmioSize = 0x1000000; /* 16MB default */

	/* Enable MMIO space */
	Status = PciIo->Attributes(
		PciIo,
		EfiPciIoAttributeOperationEnable,
		EFI_PCI_IO_ATTRIBUTE_MEMORY,
		NULL
	);

	if (EFI_ERROR(Status)) {
		Print(L"Failed to enable GPU MMIO\r\n");
		return Status;
	}

	/* Map MMIO region */
	Status = PciIo->Mem.Map(
		PciIo,
		EfiPciIoOperationBusMasterCommonBuffer,
		0, /* BAR0 */
		&MmioSize,
		MappedBase,
		NULL
	);

	return Status;
}

/* Allocate glyph substrate memory */
static EFI_STATUS allocate_glyph_memory(void **Base, UINT64 Size)
{
	EFI_STATUS Status;
	UINTN Pages = (Size + 0xFFF) / 0x1000;

	/* Allocate at 4GB+ for consistent addresses */
	UINT64 Address = 0x100000000ULL;

	Status = gBS->AllocatePages(
		AllocateMaxAddress,
		EfiRuntimeServicesData,
		Pages,
		&Address
	);

	if (EFI_ERROR(Status)) {
		Print(L"Failed to allocate glyph memory: %r\r\n", Status);
		return Status;
	}

	*Base = (void *)Address;
	Print(L"Glyph memory allocated at 0x%lx (%lu MB)\r\n",
		Address, Size / (1024 * 1024));

	return EFI_SUCCESS;
}

/* Load Geometry OS kernel from disk */
static EFI_STATUS load_kernel(EFI_HANDLE Image, void **KernelEntry)
{
	EFI_STATUS Status;
	EFI_LOADED_IMAGE_PROTOCOL *LoadedImage;
	EFI_SIMPLE_FILE_SYSTEM_PROTOCOL *FileSystem;
	EFI_FILE_PROTOCOL *Root, *KernelFile;
	UINTN KernelSize;
	void *KernelBuffer;

	/* Get boot device */
	Status = gBS->HandleProtocol(
		Image,
		&gEfiLoadedImageProtocolGuid,
		(void **)&LoadedImage
	);

	if (EFI_ERROR(Status)) {
		Print(L"Failed to get boot device\r\n");
		return Status;
	}

	/* Open filesystem */
	Status = gBS->HandleProtocol(
		LoadedImage->DeviceHandle,
		&gEfiSimpleFileSystemProtocolGuid,
		(void **)&FileSystem
	);

	if (EFI_ERROR(Status)) {
		Print(L"Failed to open filesystem\r\n");
		return Status;
	}

	Status = FileSystem->OpenVolume(FileSystem, &Root);
	if (EFI_ERROR(Status)) {
		Print(L"Failed to open root\r\n");
		return Status;
	}

	/* Open kernel file */
	Status = Root->Open(
		Root,
		&KernelFile,
		L"\\geometry_os.kernel",
		EFI_FILE_MODE_READ,
		0
	);

	if (EFI_ERROR(Status)) {
		Print(L"geometry_os.kernel not found\r\n");
		return Status;
	}

	/* Get file size */
	UINT64 FileInfoSize = 0;
	EFI_FILE_INFO *FileInfo = NULL;

	Status = KernelFile->GetInfo(KernelFile, &gEfiFileInfoGuid, &FileInfoSize, NULL);
	if (Status == EFI_BUFFER_TOO_SMALL) {
		gBS->AllocatePool(EfiBootServicesData, FileInfoSize, (void **)&FileInfo);
		KernelFile->GetInfo(KernelFile, &gEfiFileInfoGuid, &FileInfoSize, FileInfo);
	}

	KernelSize = FileInfo->FileSize;
	gBS->FreePool(FileInfo);

	/* Allocate kernel memory */
	UINTN Pages = (KernelSize + 0xFFF) / 0x1000;
	UINT64 KernelAddress = 0x100000; /* Load at 1MB */

	Status = gBS->AllocatePages(
		AllocateAddress,
		EfiLoaderCode,
		Pages,
		&KernelAddress
	);

	if (EFI_ERROR(Status)) {
		Print(L"Failed to allocate kernel memory\r\n");
		return Status;
	}

	/* Read kernel */
	Status = KernelFile->Read(KernelFile, &KernelSize, (void *)KernelAddress);
	if (EFI_ERROR(Status)) {
		Print(L"Failed to read kernel\r\n");
		return Status;
	}

	*KernelEntry = (void *)KernelAddress;
	Print(L"Kernel loaded: %lu bytes at 0x%lx\r\n", KernelSize, KernelAddress);

	KernelFile->Close(KernelFile);
	Root->Close(Root);

	return EFI_SUCCESS;
}

/* Exit boot services and jump to kernel */
static void exit_and_boot(kernel_entry_t Entry, struct geometry_os_boot_info *BootInfo)
{
	EFI_STATUS Status;
	UINTN MapKey;
	UINTN MapSize;
	UINTN DescriptorSize;
	UINT32 DescriptorVersion;
	EFI_MEMORY_DESCRIPTOR *Map;

	Print(L"Exiting boot services...\r\n");

	/* Get memory map */
	MapSize = 0;
	gBS->GetMemoryMap(&MapSize, NULL, &MapKey, &DescriptorSize, &DescriptorVersion);
	MapSize += 2 * DescriptorSize;

	gBS->AllocatePool(EfiBootServicesData, MapSize, (void **)&Map);
	gBS->GetMemoryMap(&MapSize, Map, &MapKey, &DescriptorSize, &DescriptorVersion);

	/* Exit boot services */
	Status = gBS->ExitBootServices(ImageHandle, MapKey);

	if (EFI_ERROR(Status)) {
		/* Can't print anymore - hang */
		while (1) {
			__asm__ volatile("hlt");
		}
	}

	/* Jump to kernel */
	Entry((void *)BootInfo->gpu_mmio_base, (void *)BootInfo->glyph_memory_base);
}

/* Main entry point */
EFI_STATUS EFIAPI efi_main(EFI_HANDLE Handle, EFI_SYSTEM_TABLE *SysTable)
{
	EFI_STATUS Status;
	EFI_PCI_IO_PROTOCOL *GpuPci;
	UINT64 GpuMmioBase;
	void *GlyphMemory;
	void *KernelEntry;
	kernel_entry_t KernelEntryFunc;
	struct geometry_os_boot_info BootInfo = {0};

	ImageHandle = Handle;
	SystemTable = SysTable;

	/* Initialize UEFI */
	InitializeLib(Handle, SysTable);

	Print(L"\r\n");
	Print(L"╔════════════════════════════════════════════════════════════╗\r\n");
	Print(L"║     Geometry OS - Glyph-Native Operating System            ║\r\n");
	Print(L"║     Phase 4: Bare Metal Boot                               ║\r\n");
	Print(L"╚════════════════════════════════════════════════════════════╝\r\n");
	Print(L"\r\n");

	/* Step 1: Find GPU */
	Print(L"[1/5] Finding AMD GPU...\r\n");
	Status = find_gpu(&GpuPci, &GpuMmioBase);
	if (EFI_ERROR(Status)) {
		Print(L"No GPU available, halting.\r\n");
		return Status;
	}

	/* Step 2: Map GPU MMIO */
	Print(L"[2/5] Mapping GPU MMIO at 0x%lx...\r\n", GpuMmioBase);
	Status = map_gpu_mmio(GpuPci, &GpuMmioBase);
	if (EFI_ERROR(Status)) {
		return Status;
	}

	/* Step 3: Allocate glyph memory (256MB) */
	Print(L"[3/5] Allocating glyph substrate memory...\r\n");
	Status = allocate_glyph_memory(&GlyphMemory, 256 * 1024 * 1024);
	if (EFI_ERROR(Status)) {
		return Status;
	}

	/* Step 4: Load kernel */
	Print(L"[4/5] Loading Geometry OS kernel...\r\n");
	Status = load_kernel(Handle, &KernelEntry);
	if (EFI_ERROR(Status)) {
		return Status;
	}
	KernelEntryFunc = (kernel_entry_t)KernelEntry;

	/* Step 5: Load initial glyph program (RISC-V Emulator) */
	void *InitGlyphBase;
	UINT64 InitGlyphSize;
	Status = load_file(Handle, L"\\qemu_riscv.rts.png", &InitGlyphBase, &InitGlyphSize);
	if (EFI_ERROR(Status)) {
		Print(L"qemu_riscv.rts.png not found - using window_manager.rts.png fallback\r\n");
		load_file(Handle, L"\\window_manager.rts.png", &InitGlyphBase, &InitGlyphSize);
	}

	/* Step 6: Load Guest OS (Raw Binary or RTS) */
	void *GuestOsBase;
	UINT64 GuestOsSize;
	// Try raw binary first, then fall back to RTS
	Status = load_file(Handle, L"\\ubuntu.bin", &GuestOsBase, &GuestOsSize);
	if (EFI_ERROR(Status)) {
		Status = load_file(Handle, L"\\ubuntu_native.rts.png", &GuestOsBase, &GuestOsSize);
	}
	
	if (EFI_ERROR(Status)) {
		Print(L"No guest OS binary found (tried ubuntu.bin and ubuntu_native.rts.png)\r\n");
		GuestOsBase = 0;
		GuestOsSize = 0;
	} else {
		Print(L"Guest OS loaded: %lu bytes\r\n", GuestOsSize);
	}

	/* Step 7: Load glyph microcode (required) */
	void *MicrocodeBase;
	UINT64 MicrocodeSize;
	Status = load_microcode(Handle, &MicrocodeBase, &MicrocodeSize);
	if (EFI_ERROR(Status)) {
		return Status;
	}

	/* Step 8: Load AMD Firmware Textures (Optional but recommended) */
	void *FwPfp, *FwMe, *FwCe, *FwMec, *FwRlc;
	UINT64 FwSize;
	load_file(Handle, L"\\navi10_pfp.rts.png", &FwPfp, &FwSize);
	load_file(Handle, L"\\navi10_me.rts.png", &FwMe, &FwSize);
	load_file(Handle, L"\\navi10_ce.rts.png", &FwCe, &FwSize);
	load_file(Handle, L"\\navi10_mec.rts.png", &FwMec, &FwSize);
	load_file(Handle, L"\\navi10_rlc.rts.png", &FwRlc, &FwSize);

	/* Step 9: Prepare boot info */
	Print(L"[5/5] Preparing boot information...\r\n");
	BootInfo.magic = 0x47454F535F52ULL; /* "GEOSR" */
	BootInfo.gpu_mmio_base = GpuMmioBase;
	BootInfo.gpu_mmio_size = 0x1000000;
	BootInfo.glyph_memory_base = (UINT64)GlyphMemory;
	BootInfo.glyph_memory_size = 256 * 1024 * 1024;
	BootInfo.init_glyph_base = (UINT64)InitGlyphBase;
	BootInfo.init_glyph_size = InitGlyphSize;
	BootInfo.guest_os_base = (UINT64)GuestOsBase;
	BootInfo.guest_os_size = GuestOsSize;
	BootInfo.microcode_base = (UINT64)MicrocodeBase;
	BootInfo.microcode_size = MicrocodeSize;
	BootInfo.fw_pfp_base = (UINT64)FwPfp;
	BootInfo.fw_me_base = (UINT64)FwMe;
	BootInfo.fw_ce_base = (UINT64)FwCe;
	BootInfo.fw_mec_base = (UINT64)FwMec;
	BootInfo.fw_rlc_base = (UINT64)FwRlc;

	Print(L"\r\n");
	Print(L"Boot configuration:\r\n");
	Print(L"  GPU MMIO: 0x%lx\r\n", BootInfo.gpu_mmio_base);
	Print(L"  Glyph memory: 0x%lx (%d MB)\r\n",
		BootInfo.glyph_memory_base,
		256);
	if (BootInfo.init_glyph_size > 0) {
		Print(L"  Init Glyph: 0x%lx (%lu bytes)\r\n", 
			BootInfo.init_glyph_base, BootInfo.init_glyph_size);
	}
	Print(L"  Microcode: 0x%lx (%lu bytes)\r\n", 
		BootInfo.microcode_base, BootInfo.microcode_size);
	Print(L"\r\n");
	Print(L"Starting Geometry OS...\r\n\r\n");

	/* Give time for output */
	gBS->Stall(1000000);

	/* Jump to kernel */
	exit_and_boot(KernelEntryFunc, &BootInfo);

	/* Never returns */
	return EFI_SUCCESS;
}
