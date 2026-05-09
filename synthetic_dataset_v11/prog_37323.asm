; DESCRIPTION: Renders a black disk with center (162, 135) and radius 66.
; PLAN: r0=162(x), r1=135(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 135
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
