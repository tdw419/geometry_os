; DESCRIPTION: Renders a black disk with center (411, 99) and radius 70.
; PLAN: r0=411(x), r1=99(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 411
LDI r1, 99
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
