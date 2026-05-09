; DESCRIPTION: Renders a black disk with center (134, 70) and radius 32.
; PLAN: r0=134(x), r1=70(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 70
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
