; DESCRIPTION: Creates a yellow circular shape at (397, 92) with radius 63.
; PLAN: r0=397(x), r1=92(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 397
LDI r1, 92
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
