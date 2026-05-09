; DESCRIPTION: Creates a blue circular shape at (360, 152) with radius 23.
; PLAN: r0=360(x), r1=152(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 360
LDI r1, 152
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
