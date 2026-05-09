; DESCRIPTION: Creates a magenta circular shape at (32, 162) with radius 13.
; PLAN: r0=32(x), r1=162(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 32
LDI r1, 162
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
