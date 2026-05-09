; DESCRIPTION: Renders a orange disk with center (139, 53) and radius 14.
; PLAN: r0=139(x), r1=53(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 53
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
