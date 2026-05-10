; DESCRIPTION: Composite: Places a black dot at position (274, 140) then Draws a orange line from (434, 247) to (364, 97) then Draws a blue circle centered at (411, 135) with radius 33.
; PLAN: r0=274(x), r1=140(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=434(x1), r6=247(y1), r7=364(x2), r8=97(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=411(x), r11=135(y), r12=33(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 274
LDI r1, 140
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 434
LDI r6, 247
LDI r7, 364
LDI r8, 97
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 411
LDI r11, 135
LDI r12, 33
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
