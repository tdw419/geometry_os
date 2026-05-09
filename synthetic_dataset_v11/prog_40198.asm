; DESCRIPTION: Draws a orange circle centered at (16, 69) with radius 12.
; PLAN: r0=16(x), r1=69(y), r2=12(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 16
LDI r1, 69
LDI r2, 12
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
