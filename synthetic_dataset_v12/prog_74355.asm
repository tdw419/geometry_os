; DESCRIPTION: Composite: Draws a orange line from (413, 222) to (153, 174) then Sets a single green pixel at (244, 230) then Renders a yellow disk with center (444, 104) and radius 23.
; PLAN: r0=413(x1), r1=222(y1), r2=153(x2), r3=174(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=244(x), r6=230(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=444(x), r11=104(y), r12=23(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 413
LDI r1, 222
LDI r2, 153
LDI r3, 174
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 244
LDI r6, 230
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 444
LDI r11, 104
LDI r12, 23
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
