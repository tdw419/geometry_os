; DESCRIPTION: Renders a orange circular shape at (26, 191) with radius 47.
; PLAN: r0=26(x), r1=191(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 26
LDI r1, 191
LDI r2, 47
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
