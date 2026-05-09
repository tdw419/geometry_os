; DESCRIPTION: Draws a orange circle centered at (245, 151) with radius 32.
; PLAN: r0=245(x), r1=151(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 151
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
