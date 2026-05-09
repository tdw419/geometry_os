; DESCRIPTION: Creates a blue circular shape at (424, 60) with radius 48.
; PLAN: r0=424(x), r1=60(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 60
LDI r2, 48
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
