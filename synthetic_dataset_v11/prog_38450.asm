; DESCRIPTION: Renders a black disk with center (135, 70) and radius 58.
; PLAN: r0=135(x), r1=70(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 70
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
