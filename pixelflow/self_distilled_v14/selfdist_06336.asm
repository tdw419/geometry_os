; DESCRIPTION: Draws a orange circle centered at (2, 153) with radius 27.
; PLAN: r0=2(x), r1=153(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 2
LDI r1, 153
LDI r2, 27
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
