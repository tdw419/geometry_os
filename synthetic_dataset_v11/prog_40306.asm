; DESCRIPTION: Creates a blue circular shape at (78, 220) with radius 30.
; PLAN: r0=78(x), r1=220(y), r2=30(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 220
LDI r2, 30
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
