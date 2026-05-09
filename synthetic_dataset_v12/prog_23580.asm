; DESCRIPTION: Creates a blue circular shape at (403, 136) with radius 76.
; PLAN: r0=403(x), r1=136(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 136
LDI r2, 76
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
