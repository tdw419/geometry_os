; DESCRIPTION: Draws a orange circle centered at (325, 142) with radius 61.
; PLAN: r0=325(x), r1=142(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 325
LDI r1, 142
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
