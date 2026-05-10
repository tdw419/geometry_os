; DESCRIPTION: Creates a blue circular shape at (400, 171) with radius 73.
; PLAN: r0=400(x), r1=171(y), r2=73(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 400
LDI r1, 171
LDI r2, 73
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
