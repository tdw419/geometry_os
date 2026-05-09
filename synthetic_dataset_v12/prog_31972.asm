; DESCRIPTION: Renders a orange disk with center (301, 139) and radius 76.
; PLAN: r0=301(x), r1=139(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 301
LDI r1, 139
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
