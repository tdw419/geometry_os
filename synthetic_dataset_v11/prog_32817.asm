; DESCRIPTION: Creates a blue circular shape at (170, 204) with radius 40.
; PLAN: r0=170(x), r1=204(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 204
LDI r2, 40
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
