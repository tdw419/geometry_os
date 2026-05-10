; DESCRIPTION: Renders a orange circular shape at (78, 192) with radius 32.
; PLAN: r0=78(x), r1=192(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 192
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
