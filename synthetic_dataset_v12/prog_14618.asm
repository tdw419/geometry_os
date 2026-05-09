; DESCRIPTION: Creates a magenta circular shape at (280, 36) with radius 32.
; PLAN: r0=280(x), r1=36(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 280
LDI r1, 36
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
