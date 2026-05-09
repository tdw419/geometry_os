; DESCRIPTION: Creates a magenta circular shape at (62, 151) with radius 52.
; PLAN: r0=62(x), r1=151(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 151
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
