; DESCRIPTION: Creates a magenta circular shape at (315, 106) with radius 74.
; PLAN: r0=315(x), r1=106(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 106
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
