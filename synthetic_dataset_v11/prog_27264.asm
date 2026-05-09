; DESCRIPTION: Creates a magenta circular shape at (154, 89) with radius 65.
; PLAN: r0=154(x), r1=89(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 89
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
