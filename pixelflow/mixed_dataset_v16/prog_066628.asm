; DESCRIPTION: Creates a blue circular shape at (90, 100) with radius 61.
; PLAN: r0=90(x), r1=100(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 100
LDI r2, 61
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
