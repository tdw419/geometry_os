; DESCRIPTION: Renders a blue circular shape at (18, 37) with radius 43.
; PLAN: r0=18(x), r1=37(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 18
LDI r1, 37
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
