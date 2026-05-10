; DESCRIPTION: Composite: Places a purple dot at position (55, 44) then Places a blue line segment connecting (125, 174) to (3, 56) then Draws a cyan circle centered at (347, 112) with radius 26.
; PLAN: r0=55(x), r1=44(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=125(x1), r6=174(y1), r7=3(x2), r8=56(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=347(x), r11=112(y), r12=26(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 55
LDI r1, 44
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 125
LDI r6, 174
LDI r7, 3
LDI r8, 56
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 347
LDI r11, 112
LDI r12, 26
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
