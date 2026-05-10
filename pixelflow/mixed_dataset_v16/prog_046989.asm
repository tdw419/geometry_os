; DESCRIPTION: Composite: Creates a magenta circular shape at (81, 146) with radius 51 then Renders a black box of size 110x42 starting at (118, 212) then Renders a purple line between points (93, 242) and (325, 238).
; PLAN: r0=81(x), r1=146(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=118(x), r6=212(y), r7=110(width), r8=42(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=93(x1), r11=242(y1), r12=325(x2), r13=238(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 81
LDI r1, 146
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 118
LDI r6, 212
LDI r7, 110
LDI r8, 42
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 93
LDI r11, 242
LDI r12, 325
LDI r13, 238
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
