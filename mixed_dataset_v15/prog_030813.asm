; DESCRIPTION: Renders a magenta circular shape at (14, 176) with radius 45.
; PLAN: r0=14(x), r1=176(y), r2=45(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 14
LDI r1, 176
LDI r2, 45
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
