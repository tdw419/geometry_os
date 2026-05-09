; DESCRIPTION: Renders a black disk with center (340, 149) and radius 73.
; PLAN: r0=340(x), r1=149(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 340
LDI r1, 149
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
