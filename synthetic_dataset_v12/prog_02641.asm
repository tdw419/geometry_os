; DESCRIPTION: Creates a magenta circular shape at (76, 49) with radius 17.
; PLAN: r0=76(x), r1=49(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 49
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
