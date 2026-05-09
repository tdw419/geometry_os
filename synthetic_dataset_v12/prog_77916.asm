; DESCRIPTION: Renders a black disk with center (350, 171) and radius 69.
; PLAN: r0=350(x), r1=171(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 171
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
