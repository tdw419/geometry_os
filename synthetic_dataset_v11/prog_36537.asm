; DESCRIPTION: Draws a orange circle centered at (151, 196) with radius 13.
; PLAN: r0=151(x), r1=196(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 196
LDI r2, 13
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
