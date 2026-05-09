; DESCRIPTION: Composite: Sets a single cyan pixel at (302, 203) then Places a orange line segment connecting (302, 28) to (422, 137) then Draws a green circle centered at (164, 140) with radius 13.
; PLAN: r0=302(x), r1=203(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=302(x1), r6=28(y1), r7=422(x2), r8=137(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=164(x), r11=140(y), r12=13(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 302
LDI r1, 203
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 302
LDI r6, 28
LDI r7, 422
LDI r8, 137
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 164
LDI r11, 140
LDI r12, 13
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
