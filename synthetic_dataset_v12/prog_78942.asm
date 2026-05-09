; DESCRIPTION: Composite: Sets a single white pixel at (341, 161) then Draws a orange line from (497, 150) to (24, 99) then Draws a black rectangle at (204, 106) with width 38 and height 116.
; PLAN: r0=341(x), r1=161(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=497(x1), r6=150(y1), r7=24(x2), r8=99(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=204(x), r11=106(y), r12=38(width), r13=116(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 341
LDI r1, 161
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 497
LDI r6, 150
LDI r7, 24
LDI r8, 99
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 204
LDI r11, 106
LDI r12, 38
LDI r13, 116
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
