; DESCRIPTION: Renders a orange disk with center (158, 72) and radius 48.
; PLAN: r0=158(x), r1=72(y), r2=48(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 72
LDI r2, 48
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
