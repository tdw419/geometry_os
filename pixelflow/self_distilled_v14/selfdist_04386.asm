; DESCRIPTION: Renders a magenta circular shape at (26, 87) with radius 58.
; PLAN: r0=26(x), r1=87(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 26
LDI r1, 87
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
