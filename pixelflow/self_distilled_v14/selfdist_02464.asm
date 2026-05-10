; DESCRIPTION: Draws a orange circle centered at (33, 153) with radius 21.
; PLAN: r0=33(x), r1=153(y), r2=21(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 33
LDI r1, 153
LDI r2, 21
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
