; DESCRIPTION: Creates a purple circular shape at (397, 184) with radius 63.
; PLAN: r0=397(x), r1=184(y), r2=63(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 397
LDI r1, 184
LDI r2, 63
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
