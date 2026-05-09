; DESCRIPTION: Creates a blue circular shape at (245, 83) with radius 17.
; PLAN: r0=245(x), r1=83(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 83
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
