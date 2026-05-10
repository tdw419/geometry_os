; DESCRIPTION: Creates a magenta circular shape at (424, 176) with radius 24.
; PLAN: r0=424(x), r1=176(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 176
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
