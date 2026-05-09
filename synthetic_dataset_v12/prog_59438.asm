; DESCRIPTION: Creates a magenta circular shape at (254, 163) with radius 28.
; PLAN: r0=254(x), r1=163(y), r2=28(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 163
LDI r2, 28
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
