; DESCRIPTION: Renders a orange circular shape at (286, 78) with radius 36.
; PLAN: r0=286(x), r1=78(y), r2=36(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 78
LDI r2, 36
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
