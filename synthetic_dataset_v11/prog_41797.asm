; DESCRIPTION: Creates a blue circular shape at (104, 194) with radius 52.
; PLAN: r0=104(x), r1=194(y), r2=52(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 194
LDI r2, 52
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
