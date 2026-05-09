; DESCRIPTION: Composite: Renders a yellow line between points (28, 62) and (353, 79) then Creates a cyan circular shape at (439, 127) with radius 18 then Renders a black box of size 32x64 starting at (169, 81).
; PLAN: r0=28(x1), r1=62(y1), r2=353(x2), r3=79(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=439(x), r6=127(y), r7=18(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=169(x), r11=81(y), r12=32(width), r13=64(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 28
LDI r1, 62
LDI r2, 353
LDI r3, 79
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 127
LDI r7, 18
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 169
LDI r11, 81
LDI r12, 32
LDI r13, 64
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
