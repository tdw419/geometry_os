; DESCRIPTION: Creates a blue circular shape at (397, 160) with radius 73.
; PLAN: r0=397(x), r1=160(y), r2=73(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 397
LDI r1, 160
LDI r2, 73
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
