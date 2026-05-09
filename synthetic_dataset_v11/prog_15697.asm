; DESCRIPTION: Renders a orange disk with center (171, 158) and radius 64.
; PLAN: r0=171(x), r1=158(y), r2=64(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 158
LDI r2, 64
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
