; DESCRIPTION: Renders a orange disk with center (457, 121) and radius 39.
; PLAN: r0=457(x), r1=121(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 457
LDI r1, 121
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
