; DESCRIPTION: Composite: Sets a single blue pixel at (227, 121) then Draws a orange line from (119, 209) to (290, 84) then Places a green circle of radius 64 at center (208, 162).
; PLAN: r0=227(x), r1=121(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=119(x1), r6=209(y1), r7=290(x2), r8=84(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=208(x), r11=162(y), r12=64(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 227
LDI r1, 121
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 119
LDI r6, 209
LDI r7, 290
LDI r8, 84
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 208
LDI r11, 162
LDI r12, 64
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
