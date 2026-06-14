K=kernel
U=user

# Default target: build everything
all: $K/kernel fs.img

OBJS = \
  $K/entry.o \
  $K/start.o \
  $K/console.o \
  $K/printf.o \
  $K/uart.o \
  $K/kalloc.o \
  $K/spinlock.o \
  $K/string.o \
  $K/main.o \
  $K/vm.o \
  $K/proc.o \
  $K/swtch.o \
  $K/trampoline.o \
  $K/trap.o \
  $K/syscall.o \
  $K/sysproc.o \
  $K/bio.o \
  $K/fs.o \
  $K/log.o \
  $K/sleeplock.o \
  $K/file.o \
  $K/pipe.o \
  $K/exec.o \
  $K/sysfile.o \
  $K/kernelvec.o \
  $K/stubs.o

# riscv64-unknown-elf- toolchain with RV32 multilib
TOOLPREFIX = riscv64-unknown-elf-

CC = $(TOOLPREFIX)gcc
LD = $(TOOLPREFIX)ld
OBJCOPY = $(TOOLPREFIX)objcopy
OBJDUMP = $(TOOLPREFIX)objdump

CFLAGS = -Wall -Werror -Wno-unknown-attributes -O -fno-omit-frame-pointer -ggdb -gdwarf-2
CFLAGS += -march=rv32imac_zicsr
CFLAGS += -mabi=ilp32
CFLAGS += -std=gnu99
CFLAGS += -MD
CFLAGS += -mcmodel=medany
CFLAGS += -ffreestanding
CFLAGS += -fno-common -nostdlib
CFLAGS += -nostartfiles
CFLAGS += -fno-builtin-strncpy -fno-builtin-strncmp -fno-builtin-strlen -fno-builtin-memset
CFLAGS += -fno-builtin-memmove -fno-builtin-memcmp -fno-builtin-log
CFLAGS += -fno-builtin-strchr -fno-builtin-exit -fno-builtin-malloc -fno-builtin-putc
CFLAGS += -fno-builtin-free
CFLAGS += -fno-builtin-memcpy -Wno-main
CFLAGS += -fno-builtin-printf -fno-builtin-fprintf -fno-builtin-vprintf
CFLAGS += -I.
CFLAGS += $(shell $(CC) -fno-stack-protector -E -x c /dev/null >/dev/null 2>&1 && echo -fno-stack-protector)
CFLAGS += -Wno-infinite-recursion

# Disable PIE when possible
ifneq ($(shell $(CC) -dumpspecs 2>/dev/null | grep -e '[^f]no-pie'),)
CFLAGS += -fno-pie -no-pie
endif
ifneq ($(shell $(CC) -dumpspecs 2>/dev/null | grep -e '[^f]nopie'),)
CFLAGS += -fno-pie -nopie
endif

LDFLAGS = -z max-page-size=4096 -m elf32lriscv -lgcc

# User compile flags: same as kernel but with user-specific include paths
UCFLAGS = $(CFLAGS) -Ikernel -Iuser

# User link flags
ULDFLAGS = -z max-page-size=4096 -N -m elf32lriscv

# User programs
UPROGS = \
  $U/_init \
  $U/_geos_init \
  $U/_sh \
  $U/_cat \
  $U/_echo \
  $U/_ls \
  $U/_rm \
  $U/_mkdir \
  $U/_geos_test \
  $U/_geos_demo \
  $U/_tinycalc \
  $U/_syscall_test \
  $U/_fork_test \
  $U/_ctest_read

# User library objects (common to all user programs)
ULIB = $U/crt0.o $U/usys.o $U/ulib.o $U/printf.o $U/umalloc.o

# Kernel build
$K/kernel: $(OBJS) $K/kernel.ld
	$(CC) $(CFLAGS) -nostdlib -T $K/kernel.ld -o $K/kernel $(OBJS) -lgcc
	$(OBJDUMP) -S $K/kernel > $K/kernel.asm
	$(OBJDUMP) -t $K/kernel | sed '1,/SYMBOL TABLE/d; s/ .* / /; /^$$/d' > $K/kernel.sym

GEOS_OBJS = \
  $K/geos_sys.o \
  $K/geos_main.o \
  $K/printf.o \
  $K/string.o \
  $K/bio.o \
  $K/fs.o \
  $K/log.o \
  $K/sleeplock.o \
  $K/file.o \
  $K/pipe.o \
  $K/trampoline.o \
  $K/geos_stubs.o

geos_native.elf: $(GEOS_OBJS) $K/kernel.ld
	$(CC) $(CFLAGS) -nostdlib -T $K/kernel.ld -o geos_native.elf $(GEOS_OBJS) -lgcc
	$(OBJDUMP) -S geos_native.elf > geos_native.asm

$K/%.o: $K/%.S
	$(CC) $(CFLAGS) -c -o $@ $<

$K/%.o: $K/%.c
	$(CC) $(CFLAGS) -c -o $@ $<

-include kernel/*.d

# User build rules
$U/%.o: $U/%.S
	$(CC) $(UCFLAGS) -c -o $@ $<

$U/%.o: $U/%.c
	$(CC) $(UCFLAGS) -c -o $@ $<

# Link each user program
$U/_init: $U/init.o $(ULIB)
	$(LD) $(ULDFLAGS) -T $U/Umode.ld -o $U/_init $U/init.o $(ULIB)

$U/_geos_init:
	RUSTFLAGS="-C link-arg=-T$(CURDIR)/../../../geos-init/Umode.ld -C link-arg=-z -C link-arg=max-page-size=4096" \
	  cargo build --manifest-path ../../../geos-init/Cargo.toml --target riscv32imac-unknown-none-elf
	cp ../../../geos-init/target/riscv32imac-unknown-none-elf/debug/geos-init $U/_geos_init

$U/_sh: $U/sh.o $(ULIB)
	$(LD) $(ULDFLAGS) -T $U/Umode.ld -o $U/_sh $U/sh.o $(ULIB)

$U/_cat: $U/cat.o $(ULIB)
	$(LD) $(ULDFLAGS) -T $U/Umode.ld -o $U/_cat $U/cat.o $(ULIB)

$U/_echo: $U/echo.o $(ULIB)
	$(LD) $(ULDFLAGS) -T $U/Umode.ld -o $U/_echo $U/echo.o $(ULIB)

$U/_ls: $U/ls.o $(ULIB)
	$(LD) $(ULDFLAGS) -T $U/Umode.ld -o $U/_ls $U/ls.o $(ULIB)

$U/_rm: $U/rm.o $(ULIB)
	$(LD) $(ULDFLAGS) -T $U/Umode.ld -o $U/_rm $U/rm.o $(ULIB)

$U/_mkdir: $U/mkdir.o $(ULIB)
	$(LD) $(ULDFLAGS) -T $U/Umode.ld -o $U/_mkdir $U/mkdir.o $(ULIB)

$U/_geos_test: $U/geos_test.o $(ULIB)
	$(LD) $(ULDFLAGS) -T $U/Umode.ld -o $U/_geos_test $U/geos_test.o $(ULIB)

$U/_geos_demo: $U/geos_demo.o $(ULIB)
	$(LD) $(ULDFLAGS) -T $U/Umode.ld -o $U/_geos_demo $U/geos_demo.o $(ULIB)

$U/_tinycalc: $U/tinycalc.o $(ULIB)
	$(LD) $(ULDFLAGS) -T $U/Umode.ld -o $U/_tinycalc $U/tinycalc.o $(ULIB)

$U/_syscall_test: $U/syscall_test.o $(ULIB)
	$(LD) $(ULDFLAGS) -T $U/Umode.ld -o $U/_syscall_test $U/syscall_test.o $(ULIB)

$U/_fork_test: $U/fork_test.o $(ULIB)
	$(LD) $(ULDFLAGS) -T $U/Umode.ld -o $U/_fork_test $U/fork_test.o $(ULIB)

$U/_ctest_read: $U/ctest_read.o $(ULIB)
	$(LD) $(ULDFLAGS) -T $U/Umode.ld -o $U/_ctest_read $U/ctest_read.o $(ULIB)

-include user/*.d

# Build the filesystem image
fs.img: tools/mkfs_rv32.py $(UPROGS)
	python3 tools/mkfs_rv32.py fs.img $(UPROGS)

# Generate stubs_data.h from the user binaries (embedded disk blocks)
kernel/stubs_data.h: tools/gen_stubs.py $(UPROGS)
	python3 tools/gen_stubs.py kernel/stubs_data.h $(UPROGS)

# stubs.c depends on the generated data
kernel/stubs.o: kernel/stubs_data.h

clean:
	rm -f $K/*.o $K/*.d $K/*.asm $K/*.sym $K/kernel $K/stubs_data.h
	rm -f $U/*.o $U/*.d $U/*.asm $U/_*
