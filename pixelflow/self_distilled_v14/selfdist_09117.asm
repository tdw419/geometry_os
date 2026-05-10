; DESCRIPTION: Renders a magenta circular shape at (8, 68) with radius 11.
; PLAN: r0=8(x), r1=68(y), r2=11(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 8
LDI r1, 68
LDI r2, 11
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
