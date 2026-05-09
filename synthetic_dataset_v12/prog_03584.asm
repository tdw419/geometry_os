; DESCRIPTION: Renders a orange disk with center (61, 192) and radius 38.
; PLAN: r0=61(x), r1=192(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 192
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
