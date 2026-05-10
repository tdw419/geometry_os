; DESCRIPTION: Renders a blue circular shape at (286, 28) with radius 39.
; PLAN: r0=286(x), r1=28(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 28
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
