; DESCRIPTION: Renders a black disk with center (475, 39) and radius 25.
; PLAN: r0=475(x), r1=39(y), r2=25(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 475
LDI r1, 39
LDI r2, 25
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
