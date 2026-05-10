; DESCRIPTION: Renders a magenta circular shape at (93, 123) with radius 68.
; PLAN: r0=93(x), r1=123(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 123
LDI r2, 68
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
