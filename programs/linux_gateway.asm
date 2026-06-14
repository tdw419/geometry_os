main:
    LDI r0, 0
    FILL r0
    LDI r1, 60
    LDI r2, 50
    LDI r3, 0xFFFFFF
    LDI r10, 0x2100
    STRO r10, "GEOMETRY LINUX"
    DRAWTEXT r1, r2, r10, r3, r0
    LDI r1, 40
    LDI r2, 120
    LDI r11, 0x2200
    STRO r11, "Press [L] to Boot Linux"
    DRAWTEXT r1, r2, r11, r3, r0
    LDI r1, 40
    LDI r2, 140
    LDI r12, 0x2300
    STRO r12, "Press [Esc] for Terminal"
    DRAWTEXT r1, r2, r12, r3, r0
loop:
    FRAME
    IKEY r4
    CMPI r4, 76
    JZ r0, boot_linux
    CMPI r4, 27
    JZ r0, exit
    JMP loop
boot_linux:
    LDI r10, 0x3000
    STRO r10, "arch=riscv64 mode=native kernel=region:1 initrd=region:2 ram=256M"
    LDI r0, 0x000033
    FILL r0
    LDI r1, 20
    LDI r2, 100
    LDI r3, 0x00FF00
    LDI r11, 0x3100
    STRO r11, "BOOTING LINUX FROM PIXELS..."
    DRAWTEXT r1, r2, r11, r3, r0
    FRAME
    HYPERVISOR r10
    HALT
exit:
    HALT

; --- EOF PADDING ---
; This padding protects the code from tail truncation.
; ...................................................
; ...................................................
; ...................................................
; ...................................................
