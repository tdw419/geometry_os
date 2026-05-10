; DESCRIPTION: Composite: Places a green line segment connecting (505, 43) to (13, 248) then Renders a blue disk with center (139, 117) and radius 53 then Places a orange dot at position (260, 245).
; PLAN: r0=505(x1), r1=43(y1), r2=13(x2), r3=248(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=139(x), r6=117(y), r7=53(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=260(x), r11=245(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 505
LDI r1, 43
LDI r2, 13
LDI r3, 248
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 139
LDI r6, 117
LDI r7, 53
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 260
LDI r11, 245
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
