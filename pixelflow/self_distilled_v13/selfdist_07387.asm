; DESCRIPTION: Draws a orange circle centered at (20, 103) with radius 24.
; PLAN: r0=20(x), r1=103(y), r2=24(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 20
LDI r1, 103
LDI r2, 24
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
