; DESCRIPTION: Renders a orange disk with center (192, 100) and radius 39.
; PLAN: r0=192(x), r1=100(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 100
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
