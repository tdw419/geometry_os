; DESCRIPTION: Composite: Draws a white line from (254, 23) to (467, 52) then Renders a orange disk with center (112, 118) and radius 34.
; PLAN: r0=254(x1), r1=23(y1), r2=467(x2), r3=52(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=112(x), r6=118(y), r7=34(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 254
LDI r1, 23
LDI r2, 467
LDI r3, 52
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 118
LDI r7, 34
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
