; DESCRIPTION: Draws a orange circle centered at (131, 109) with radius 44.
; PLAN: r0=131(x), r1=109(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 109
LDI r2, 44
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
