; DESCRIPTION: Composite: Renders a yellow line between points (292, 131) and (103, 80) then Places a purple circle of radius 79 at center (190, 167) then Draws a magenta rectangle at (76, 4) with width 53 and height 89.
; PLAN: r0=292(x1), r1=131(y1), r2=103(x2), r3=80(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=190(x), r6=167(y), r7=79(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=76(x), r11=4(y), r12=53(width), r13=89(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 292
LDI r1, 131
LDI r2, 103
LDI r3, 80
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 167
LDI r7, 79
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 76
LDI r11, 4
LDI r12, 53
LDI r13, 89
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
