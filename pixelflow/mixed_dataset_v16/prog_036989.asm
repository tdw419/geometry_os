; DESCRIPTION: Creates a magenta circular shape at (244, 96) with radius 76.
; PLAN: r0=244(x), r1=96(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 96
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
