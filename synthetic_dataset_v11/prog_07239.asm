; DESCRIPTION: Draws a orange circle centered at (142, 42) with radius 33.
; PLAN: r0=142(x), r1=42(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 42
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
