; DESCRIPTION: Draws a orange circle centered at (365, 149) with radius 72.
; PLAN: r0=365(x), r1=149(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 365
LDI r1, 149
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
