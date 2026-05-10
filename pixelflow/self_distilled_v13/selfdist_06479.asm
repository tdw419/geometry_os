; DESCRIPTION: Renders a magenta circular shape at (219, 87) with radius 49.
; PLAN: r0=219(x), r1=87(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 219
LDI r1, 87
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
