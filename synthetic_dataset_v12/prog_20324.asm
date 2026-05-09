; DESCRIPTION: Composite: Sets a single purple pixel at (12, 50) then Places a blue line segment connecting (159, 144) to (241, 134) then Draws a green circle centered at (312, 106) with radius 28.
; PLAN: r0=12(x), r1=50(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=159(x1), r6=144(y1), r7=241(x2), r8=134(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=312(x), r11=106(y), r12=28(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 12
LDI r1, 50
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 159
LDI r6, 144
LDI r7, 241
LDI r8, 134
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 312
LDI r11, 106
LDI r12, 28
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
