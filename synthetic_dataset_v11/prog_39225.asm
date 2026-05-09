; DESCRIPTION: Creates a yellow circular shape at (159, 114) with radius 37.
; PLAN: r0=159(x), r1=114(y), r2=37(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 114
LDI r2, 37
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
