; DESCRIPTION: Composite: Sets a single blue pixel at (152, 84) then Places a black line segment connecting (363, 8) to (430, 148) then Draws a magenta circle centered at (269, 74) with radius 41.
; PLAN: r0=152(x), r1=84(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=363(x1), r6=8(y1), r7=430(x2), r8=148(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=269(x), r11=74(y), r12=41(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 152
LDI r1, 84
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 363
LDI r6, 8
LDI r7, 430
LDI r8, 148
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 269
LDI r11, 74
LDI r12, 41
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
