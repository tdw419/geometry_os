; DESCRIPTION: Draws a orange circle centered at (150, 176) with radius 53.
; PLAN: r0=150(x), r1=176(y), r2=53(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 150
LDI r1, 176
LDI r2, 53
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
