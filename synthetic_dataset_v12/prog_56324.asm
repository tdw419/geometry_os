; DESCRIPTION: Creates a blue circular shape at (422, 25) with radius 19.
; PLAN: r0=422(x), r1=25(y), r2=19(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 422
LDI r1, 25
LDI r2, 19
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
