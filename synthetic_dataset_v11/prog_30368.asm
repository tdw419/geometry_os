; DESCRIPTION: Creates a blue circular shape at (204, 121) with radius 40.
; PLAN: r0=204(x), r1=121(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 121
LDI r2, 40
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
