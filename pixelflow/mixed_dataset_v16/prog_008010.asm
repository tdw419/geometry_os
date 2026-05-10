; DESCRIPTION: Draws a orange circle centered at (137, 67) with radius 16.
; PLAN: r0=137(x), r1=67(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 67
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
