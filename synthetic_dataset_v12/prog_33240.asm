; DESCRIPTION: Draws a orange circle centered at (341, 44) with radius 42.
; PLAN: r0=341(x), r1=44(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 341
LDI r1, 44
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
