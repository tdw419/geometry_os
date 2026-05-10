; DESCRIPTION: Creates a blue circular shape at (409, 71) with radius 38.
; PLAN: r0=409(x), r1=71(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 409
LDI r1, 71
LDI r2, 38
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
