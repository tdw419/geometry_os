; DESCRIPTION: Creates a blue circular shape at (397, 215) with radius 34.
; PLAN: r0=397(x), r1=215(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 397
LDI r1, 215
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
