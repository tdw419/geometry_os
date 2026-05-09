; DESCRIPTION: Creates a blue circular shape at (425, 200) with radius 28.
; PLAN: r0=425(x), r1=200(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 425
LDI r1, 200
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
