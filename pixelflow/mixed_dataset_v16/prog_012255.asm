; DESCRIPTION: Creates a magenta circular shape at (421, 157) with radius 70.
; PLAN: r0=421(x), r1=157(y), r2=70(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 157
LDI r2, 70
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
