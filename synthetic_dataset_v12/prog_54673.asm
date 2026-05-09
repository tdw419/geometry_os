; DESCRIPTION: Creates a blue circular shape at (420, 158) with radius 78.
; PLAN: r0=420(x), r1=158(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 158
LDI r2, 78
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
