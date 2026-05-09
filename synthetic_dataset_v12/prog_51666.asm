; DESCRIPTION: Renders a red disk with center (436, 43) and radius 11.
; PLAN: r0=436(x), r1=43(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 436
LDI r1, 43
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
