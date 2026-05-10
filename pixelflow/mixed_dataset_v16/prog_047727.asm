; DESCRIPTION: Composite: Renders a yellow disk with center (305, 138) and radius 54 then Renders a black box of size 112x101 starting at (11, 32) then Renders a purple line between points (292, 20) and (476, 240).
; PLAN: r0=305(x), r1=138(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=11(x), r6=32(y), r7=112(width), r8=101(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=292(x1), r11=20(y1), r12=476(x2), r13=240(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 305
LDI r1, 138
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 11
LDI r6, 32
LDI r7, 112
LDI r8, 101
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 292
LDI r11, 20
LDI r12, 476
LDI r13, 240
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
