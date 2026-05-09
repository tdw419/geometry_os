; DESCRIPTION: Creates a blue circular shape at (261, 50) with radius 33.
; PLAN: r0=261(x), r1=50(y), r2=33(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 50
LDI r2, 33
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
