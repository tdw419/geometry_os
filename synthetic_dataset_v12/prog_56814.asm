; DESCRIPTION: Creates a orange circular shape at (336, 144) with radius 24.
; PLAN: r0=336(x), r1=144(y), r2=24(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 336
LDI r1, 144
LDI r2, 24
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
