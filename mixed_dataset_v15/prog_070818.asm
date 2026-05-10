; DESCRIPTION: Renders a orange disk with center (259, 76) and radius 10.
; PLAN: r0=259(x), r1=76(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 259
LDI r1, 76
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
