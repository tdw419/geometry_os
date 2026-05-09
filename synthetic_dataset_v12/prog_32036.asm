; DESCRIPTION: Composite: Places a magenta dot at position (490, 5) then Renders a red line between points (471, 201) and (137, 189) then Draws a blue rectangle at (323, 18) with width 43 and height 99.
; PLAN: r0=490(x), r1=5(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=471(x1), r6=201(y1), r7=137(x2), r8=189(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=323(x), r11=18(y), r12=43(width), r13=99(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 490
LDI r1, 5
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 471
LDI r6, 201
LDI r7, 137
LDI r8, 189
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 323
LDI r11, 18
LDI r12, 43
LDI r13, 99
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
