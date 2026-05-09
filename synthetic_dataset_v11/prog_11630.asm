; DESCRIPTION: Creates a blue circular shape at (100, 117) with radius 80.
; PLAN: r0=100(x), r1=117(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 117
LDI r2, 80
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
