; DESCRIPTION: Draws a orange circle centered at (28, 109) with radius 16.
; PLAN: r0=28(x), r1=109(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 28
LDI r1, 109
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
