; DESCRIPTION: Creates a magenta circular shape at (70, 64) with radius 15.
; PLAN: r0=70(x), r1=64(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 64
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
