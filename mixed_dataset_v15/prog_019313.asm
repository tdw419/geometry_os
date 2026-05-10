; DESCRIPTION: Creates a blue circular shape at (420, 172) with radius 70.
; PLAN: r0=420(x), r1=172(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 172
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
