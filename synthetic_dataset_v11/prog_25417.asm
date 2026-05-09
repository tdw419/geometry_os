; DESCRIPTION: Renders a orange disk with center (77, 198) and radius 49.
; PLAN: r0=77(x), r1=198(y), r2=49(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 198
LDI r2, 49
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
