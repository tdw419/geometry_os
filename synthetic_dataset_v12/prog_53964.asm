; DESCRIPTION: Composite: Renders a red line between points (215, 156) and (16, 81) then Renders a yellow disk with center (231, 108) and radius 36 then Renders a black box of size 65x74 starting at (14, 145).
; PLAN: r0=215(x1), r1=156(y1), r2=16(x2), r3=81(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=231(x), r6=108(y), r7=36(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=14(x), r11=145(y), r12=65(width), r13=74(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 215
LDI r1, 156
LDI r2, 16
LDI r3, 81
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 231
LDI r6, 108
LDI r7, 36
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 14
LDI r11, 145
LDI r12, 65
LDI r13, 74
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
