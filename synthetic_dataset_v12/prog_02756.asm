; DESCRIPTION: Composite: Draws a orange line from (254, 142) to (436, 151) then Creates a green circular shape at (104, 183) with radius 31.
; PLAN: r0=254(x1), r1=142(y1), r2=436(x2), r3=151(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=104(x), r6=183(y), r7=31(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 254
LDI r1, 142
LDI r2, 436
LDI r3, 151
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 104
LDI r6, 183
LDI r7, 31
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
