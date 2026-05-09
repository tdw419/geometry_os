; DESCRIPTION: Renders a black disk with center (90, 108) and radius 75.
; PLAN: r0=90(x), r1=108(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 108
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
