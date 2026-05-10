; DESCRIPTION: Renders a orange circular shape at (78, 37) with radius 19.
; PLAN: r0=78(x), r1=37(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 37
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
