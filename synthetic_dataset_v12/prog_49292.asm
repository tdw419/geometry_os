; DESCRIPTION: Draws a orange circle centered at (18, 133) with radius 16.
; PLAN: r0=18(x), r1=133(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 18
LDI r1, 133
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
