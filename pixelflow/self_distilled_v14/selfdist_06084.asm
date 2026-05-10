; DESCRIPTION: Renders a yellow circular shape at (257, 122) with radius 43.
; PLAN: r0=257(x), r1=122(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 257
LDI r1, 122
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
