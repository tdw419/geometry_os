; DESCRIPTION: Creates a blue circular shape at (104, 50) with radius 28.
; PLAN: r0=104(x), r1=50(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 50
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
