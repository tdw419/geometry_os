; DESCRIPTION: Creates a blue circular shape at (150, 179) with radius 38.
; PLAN: r0=150(x), r1=179(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 150
LDI r1, 179
LDI r2, 38
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
