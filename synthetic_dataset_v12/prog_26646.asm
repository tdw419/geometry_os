; DESCRIPTION: Creates a blue circular shape at (167, 100) with radius 74.
; PLAN: r0=167(x), r1=100(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 100
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
