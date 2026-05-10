; DESCRIPTION: Renders a magenta circular shape at (22, 75) with radius 32.
; PLAN: r0=22(x), r1=75(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 22
LDI r1, 75
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
