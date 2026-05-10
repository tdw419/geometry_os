; DESCRIPTION: Renders a orange disk with center (259, 120) and radius 24.
; PLAN: r0=259(x), r1=120(y), r2=24(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 259
LDI r1, 120
LDI r2, 24
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
