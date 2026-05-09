; DESCRIPTION: Composite: Places a purple circle of radius 25 at center (195, 200) then Draws a orange line from (496, 209) to (268, 122).
; PLAN: r0=195(x), r1=200(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=496(x1), r6=209(y1), r7=268(x2), r8=122(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 195
LDI r1, 200
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 496
LDI r6, 209
LDI r7, 268
LDI r8, 122
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
