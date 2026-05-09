; DESCRIPTION: Composite: Places a green dot at position (31, 13) then Renders a yellow box of size 119x114 starting at (221, 56) then Places a orange line segment connecting (81, 179) to (43, 230).
; PLAN: r0=31(x), r1=13(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=221(x), r6=56(y), r7=119(width), r8=114(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=81(x1), r11=179(y1), r12=43(x2), r13=230(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 31
LDI r1, 13
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 221
LDI r6, 56
LDI r7, 119
LDI r8, 114
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 81
LDI r11, 179
LDI r12, 43
LDI r13, 230
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
