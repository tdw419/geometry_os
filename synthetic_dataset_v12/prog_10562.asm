; DESCRIPTION: Creates a blue circular shape at (409, 98) with radius 31.
; PLAN: r0=409(x), r1=98(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 409
LDI r1, 98
LDI r2, 31
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
