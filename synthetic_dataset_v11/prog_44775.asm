; DESCRIPTION: Creates a magenta circular shape at (64, 179) with radius 59.
; PLAN: r0=64(x), r1=179(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 179
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
