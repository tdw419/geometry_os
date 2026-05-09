; DESCRIPTION: Composite: Places a yellow dot at position (348, 52) then Renders a white line between points (296, 248) and (254, 60) then Creates a purple circular shape at (451, 31) with radius 23.
; PLAN: r0=348(x), r1=52(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=296(x1), r6=248(y1), r7=254(x2), r8=60(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=451(x), r11=31(y), r12=23(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 348
LDI r1, 52
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 296
LDI r6, 248
LDI r7, 254
LDI r8, 60
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 451
LDI r11, 31
LDI r12, 23
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
