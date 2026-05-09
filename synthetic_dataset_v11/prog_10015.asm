; DESCRIPTION: Renders a black disk with center (171, 65) and radius 19.
; PLAN: r0=171(x), r1=65(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 65
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
