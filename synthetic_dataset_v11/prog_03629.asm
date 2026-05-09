; DESCRIPTION: Draws a orange circle centered at (151, 87) with radius 17.
; PLAN: r0=151(x), r1=87(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 87
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
