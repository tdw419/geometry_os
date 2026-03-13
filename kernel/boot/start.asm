; Geometry OS Kernel - Multiboot2 Entry Point
; Boots via GRUB with multiboot protocol

bits 32

section .multiboot align=8
mboot2_header:
    dd 0xE85250D6           ; magic
    dd 0                     ; architecture (i386)
    dd mboot2_header_end - mboot2_header  ; header length
    dd 0x100000000 - (0xE85250D6 + 0 + (mboot2_header_end - mboot2_header))  ; checksum

    ; framebuffer tag
    align 8
    dw 5, 0                  ; type=5 (framebuffer), flags=0
    dd 20                     ; size
    dd 1024                   ; width
    dd 768                    ; height
    dd 32                     ; depth

    ; end tag
    align 8
    dw 0, 0
    dd 8
mboot2_header_end:

section .text
global _start
extern kernel_main

_start:
    cli
    mov esp, stack_top

    ; EARLY DEBUG: print 'S' to serial port to verify we reach kernel
    mov dx, 0x3F8 + 5
.wait_serial_init:
    in al, dx
    test al, 0x20
    jz .wait_serial_init
    mov dx, 0x3F8
    mov al, 'S'
    out dx, al
    mov al, 'T'
    out dx, al
    mov al, 'A'
    out dx, al
    mov al, 'R'
    out dx, al
    mov al, 'T'
    out dx, al
    mov al, 13
    out dx, al
    mov al, 10
    out dx, al

    ; Save multiboot info
    mov [mboot_info], ebx
    mov al, 'M'
    out dx, al
    mov al, 13
    out dx, al
    mov al, 10
    out dx, al

    ; Check for long mode (CPUID.80000001:EDX bit 29)
    mov eax, 0x80000000
    cpuid
    cmp eax, 0x80000001
    jb .halt

    mov eax, 0x80000001
    cpuid
    test edx, (1 << 29)
    jz .halt

    ; Debug: long mode supported
    mov dx, 0x3F8
    mov al, 'L'
    out dx, al
    mov al, 13
    out dx, al
    mov al, 10
    out dx, al

    ; Setup identity-mapped paging (first 8MB + framebuffer at 0xE0000000)
    ; PML4 at 0x1000, PDPT at 0x2000, PD at 0x3000
    ; PD_fb at 0x4000 for framebuffer region
    mov edi, 0x1000
    mov cr3, edi
    xor eax, eax
    mov ecx, 0x5000
    rep stosd

    ; Debug: page tables cleared
    mov dx, 0x3F8
    mov al, 'P'
    out dx, al
    mov al, 13
    out dx, al
    mov al, 10
    out dx, al

    ; PML4[0] -> PDPT at 0x2000
    mov dword [0x1000], 0x2003
    ; PDPT[0] -> PD at 0x3000 (first 1GB, maps 0x0-0x3FFFFFFF)
    mov dword [0x2000], 0x3003
    ; PD[0-3] -> 2MB pages (first 8MB)
    mov dword [0x3000], 0x83
    mov dword [0x3008], 0x200083
    mov dword [0x3010], 0x400083
    mov dword [0x3018], 0x600083

    ; Map framebuffer at 0xE0000000 (3.5GB mark) - for real Intel GPU
    ; 0xE0000000 >> 30 = 0x38 = 56, so PDPT[56]
    ; PDPT[56] -> PD_fb at 0x4000
    mov dword [0x2000 + 56 * 8], 0x4003
    ; PD_fb[0-3] -> 2MB pages starting at 0xE0000000
    mov dword [0x4000], 0xE0000083      ; 0xE0000000 - 0xE1FFFFFF
    mov dword [0x4008], 0xE2000083      ; 0xE2000000 - 0xE3FFFFFF
    mov dword [0x4010], 0xE4000083      ; 0xE4000000 - 0xE5FFFFFF
    mov dword [0x4018], 0xE6000083      ; 0xE6000000 - 0xE7FFFFFF

    ; Map QEMU framebuffer region at 0xFD000000 (high 32-bit address space)
    ; 0xFD000000 >> 30 = 3, so PDPT[3] (0xC0000000-0xFFFFFFFF)
    ; Use PD at 0x5000 for this region
    mov dword [0x2000 + 3 * 8], 0x5003   ; PDPT[3] -> PD_qemu at 0x5000
    ; Map 0xFC000000-0xFFFFFFFF region
    ; Within PDPT[3], index = (addr - 0xC0000000) >> 21
    ; 0xFC000000: (0xFC000000 - 0xC0000000) >> 21 = 0x1E0 = 480
    ; 0xFE000000: (0xFE000000 - 0xC0000000) >> 21 = 0x1F0 = 496
    ; Map a range covering typical QEMU framebuffer addresses
    mov dword [0x5000 + 480 * 8], 0xFC000083  ; 0xFC000000 - 0xFDFFFFFF
    mov dword [0x5000 + 481 * 8], 0xFE000083  ; 0xFE000000 - 0xFFFFFFFF
    mov dword [0x5000 + 482 * 8], 0x00000083  ; 0x00000000 - 0x001FFFFF (wrap for safety)
    ; Also map 0xFD000000 specifically (index 488)
    mov dword [0x5000 + 488 * 8], 0xFD000083  ; 0xFD000000 - 0xFEFFFFFF

    ; Enable PAE
    mov eax, cr4
    or eax, (1 << 5)
    mov cr4, eax

    ; Enable long mode in EFER
    mov ecx, 0xC0000080
    rdmsr
    or eax, (1 << 8)
    wrmsr

    ; Enable paging
    mov eax, cr0
    or eax, (1 << 31)
    mov cr0, eax

    ; Load 64-bit GDT
    lgdt [gdt64_pointer]

    ; Far jump to 64-bit code
    jmp 0x08:long_mode

.halt:
    hlt
    jmp .halt

bits 64
long_mode:
    mov ax, 0x10
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax

    mov rsp, stack_top

    ; Paging is required for 64-bit mode - don't disable it
    ; The framebuffer should be accessible through our page tables

    ; Debug: print "PAGE ON\r\n"
    mov dx, 0x3F8 + 5
.wait_page_on:
    in al, dx
    test al, 0x20
    jz .wait_page_on
    mov dx, 0x3F8
    mov al, 'P'
    out dx, al
    mov al, 'A'
    out dx, al
    mov al, 'G'
    out dx, al
    mov al, 'E'
    out dx, al
    mov al, ' '
    out dx, al
    mov al, 'O'
    out dx, al
    mov al, 'N'
    out dx, al
    mov al, 13
    out dx, al
    mov al, 10
    out dx, al

    ; Debug: print "64-BIT OK\r\n"
    mov dx, 0x3F8 + 5
.wait1:
    in al, dx
    test al, 0x20
    jz .wait1
    mov dx, 0x3F8
    mov rax, '64-BIT '
    out dx, al
    shr rax, 8
    out dx, al
    shr rax, 8
    out dx, al
    shr rax, 8
    out dx, al
    shr rax, 8
    out dx, al
    shr rax, 8
    out dx, al
    shr rax, 8
    out dx, al

    ; Debug: print "CALLING K\r\n"
    mov dx, 0x3F8 + 5
.wait2:
    in al, dx
    test al, 0x20
    jz .wait2
    mov dx, 0x3F8
    mov rax, 'CALLING '
.wait2_loop:
    out dx, al
    shr rax, 8
    test rax, rax
    jnz .wait2_loop

    ; Pass multiboot2 info pointer to kernel_main
    ; kernel_main will parse it to get real framebuffer address
    mov rdi, [mboot_info]    ; mboot_info pointer

    call kernel_main

    ; Debug: if we return, print "RET\r\n"
    mov dx, 0x3F8 + 5
.wait3:
    in al, dx
    test al, 0x20
    jz .wait3
    mov dx, 0x3F8
    mov al, 'R'
    out dx, al
    mov al, 'E'
    out dx, al
    mov al, 'T'
    out dx, al

.halt64:
    cli
    hlt
    jmp .halt64

section .rodata
align 16
gdt64:
    dq 0
    dq 0x00AF9A000000FFFF  ; code segment
    dq 0x00CF92000000FFFF  ; data segment
gdt64_pointer:
    dw gdt64_pointer - gdt64 - 1
    dq gdt64

section .data
mboot_info: dd 0

section .bss
align 16
stack_bottom: resb 65536
stack_top:
