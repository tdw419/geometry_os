; DESCRIPTION: Draws a orange circle centered at (38, 116) with radius 29.
; PLAN: r0=38(x), r1=116(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 38
LDI r1, 116
LDI r2, 29
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
