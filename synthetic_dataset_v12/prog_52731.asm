; DESCRIPTION: Creates a purple circular shape at (422, 148) with radius 44.
; PLAN: r0=422(x), r1=148(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 422
LDI r1, 148
LDI r2, 44
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
