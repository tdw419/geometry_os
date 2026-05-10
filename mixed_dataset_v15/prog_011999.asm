; DESCRIPTION: Composite: Renders a yellow line between points (506, 15) and (9, 13) then Draws a black rectangle at (432, 105) with width 46 and height 64.
; PLAN: r0=506(x1), r1=15(y1), r2=9(x2), r3=13(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=432(x), r6=105(y), r7=46(width), r8=64(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 506
LDI r1, 15
LDI r2, 9
LDI r3, 13
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 432
LDI r6, 105
LDI r7, 46
LDI r8, 64
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
