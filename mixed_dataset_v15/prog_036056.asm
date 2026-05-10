; DESCRIPTION: Draws a orange circle centered at (3, 154) with radius 72.
; PLAN: r0=3(x), r1=154(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 3
LDI r1, 154
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
