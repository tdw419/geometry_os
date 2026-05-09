; DESCRIPTION: Renders a orange disk with center (476, 120) and radius 34.
; PLAN: r0=476(x), r1=120(y), r2=34(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 476
LDI r1, 120
LDI r2, 34
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
