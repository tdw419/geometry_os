; DESCRIPTION: Composite: Places a green line segment connecting (119, 192) to (265, 113) then Places a orange dot at position (127, 139) then Places a orange circle of radius 29 at center (88, 222).
; PLAN: r0=119(x1), r1=192(y1), r2=265(x2), r3=113(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=127(x), r6=139(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=88(x), r11=222(y), r12=29(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 119
LDI r1, 192
LDI r2, 265
LDI r3, 113
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 127
LDI r6, 139
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 88
LDI r11, 222
LDI r12, 29
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
