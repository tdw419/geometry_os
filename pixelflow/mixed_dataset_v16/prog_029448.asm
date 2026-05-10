; DESCRIPTION: Composite: Draws a black circle centered at (399, 185) with radius 59 then Renders a white line between points (221, 39) and (109, 123) then Sets a single green pixel at (17, 201).
; PLAN: r0=399(x), r1=185(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=221(x1), r6=39(y1), r7=109(x2), r8=123(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=17(x), r11=201(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 399
LDI r1, 185
LDI r2, 59
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 221
LDI r6, 39
LDI r7, 109
LDI r8, 123
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 17
LDI r11, 201
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
