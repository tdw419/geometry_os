; DESCRIPTION: Composite: Places a white circle of radius 77 at center (254, 98) then Draws a orange line from (451, 123) to (312, 136).
; PLAN: r0=254(x), r1=98(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=451(x1), r6=123(y1), r7=312(x2), r8=136(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 254
LDI r1, 98
LDI r2, 77
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 451
LDI r6, 123
LDI r7, 312
LDI r8, 136
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
