; DESCRIPTION: Creates a green circular shape at (159, 108) with radius 17.
; PLAN: r0=159(x), r1=108(y), r2=17(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 108
LDI r2, 17
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
