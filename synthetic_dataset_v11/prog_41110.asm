; DESCRIPTION: Creates a blue circular shape at (74, 126) with radius 60.
; PLAN: r0=74(x), r1=126(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 126
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
