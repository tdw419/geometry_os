; DESCRIPTION: Creates a magenta circular shape at (75, 95) with radius 32.
; PLAN: r0=75(x), r1=95(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 95
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
