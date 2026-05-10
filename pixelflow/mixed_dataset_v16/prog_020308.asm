; DESCRIPTION: Renders a blue circular shape at (257, 19) with radius 69.
; PLAN: r0=257(x), r1=19(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 257
LDI r1, 19
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
