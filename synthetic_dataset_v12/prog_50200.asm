; DESCRIPTION: Renders a black disk with center (411, 38) and radius 30.
; PLAN: r0=411(x), r1=38(y), r2=30(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 411
LDI r1, 38
LDI r2, 30
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
