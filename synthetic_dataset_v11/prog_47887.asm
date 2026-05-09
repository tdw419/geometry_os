; DESCRIPTION: Creates a blue circular shape at (152, 75) with radius 24.
; PLAN: r0=152(x), r1=75(y), r2=24(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 75
LDI r2, 24
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
