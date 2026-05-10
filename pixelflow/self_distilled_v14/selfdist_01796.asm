; DESCRIPTION: Renders a magenta circular shape at (84, 54) with radius 45.
; PLAN: r0=84(x), r1=54(y), r2=45(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 54
LDI r2, 45
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
