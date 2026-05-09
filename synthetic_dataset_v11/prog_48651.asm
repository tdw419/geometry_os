; DESCRIPTION: Renders a black disk with center (69, 60) and radius 20.
; PLAN: r0=69(x), r1=60(y), r2=20(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 60
LDI r2, 20
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
