; DESCRIPTION: Creates a magenta circular shape at (345, 100) with radius 65.
; PLAN: r0=345(x), r1=100(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 345
LDI r1, 100
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
