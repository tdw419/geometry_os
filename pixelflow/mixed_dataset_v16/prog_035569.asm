; DESCRIPTION: Composite: Draws a orange circle centered at (52, 178) with radius 34 then Renders a white line between points (409, 57) and (102, 188).
; PLAN: r0=52(x), r1=178(y), r2=34(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=409(x1), r6=57(y1), r7=102(x2), r8=188(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 52
LDI r1, 178
LDI r2, 34
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 409
LDI r6, 57
LDI r7, 102
LDI r8, 188
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
