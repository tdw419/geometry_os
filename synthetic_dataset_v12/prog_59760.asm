; DESCRIPTION: Composite: Sets a single blue pixel at (499, 62) then Renders a orange line between points (17, 32) and (484, 204) then Draws a orange circle centered at (71, 165) with radius 44.
; PLAN: r0=499(x), r1=62(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=17(x1), r6=32(y1), r7=484(x2), r8=204(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=71(x), r11=165(y), r12=44(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 499
LDI r1, 62
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 17
LDI r6, 32
LDI r7, 484
LDI r8, 204
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 71
LDI r11, 165
LDI r12, 44
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
