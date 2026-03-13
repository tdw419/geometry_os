# Geometry OS UEFI Bootloader
#
# Build: make
# Output: bootloader.efi

# Toolchain - use gnu-efi
EFI_INCLUDE = /usr/include/efi
EFI_LIBS = /usr/lib
EFI_CRTO = /usr/lib/crt0-efi-x86_64.o
EFI_LDS = /usr/lib/elf_x86_64_efi.lds

CC = gcc
CFLAGS = -ffreestanding -fno-stack-protector -fpic \
	-fshort-wchar -mno-red-zone \
	-I$(EFI_INCLUDE) -I$(EFI_INCLUDE)/x86_64 \
	-DEFI_FUNCTION_WRAPPER

LDFLAGS = -nostdlib -znocombreloc \
	-T$(EFI_LDS) -shared -Bsymbolic \
	-L$(EFI_LIBS) -l:libgnuefi.a -l:libefi.a

OBJS = boot.o

all: geometry_os_bootloader.efi

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Build shared library first
boot.so: $(OBJS)
	$(LD) $(LDFLAGS) $(OBJS) -o $@

# Convert to EFI executable
geometry_os_bootloader.efi: boot.so
	objcopy -j .text -j .sdata -j .data -j .dynamic \
		-j .dynsym -j .rel \
		-j .rela -j .reloc \
		--target=efi-app-x86_64 $< $@

clean:
	rm -f *.o *.so *.efi

.PHONY: all clean
