; DESCRIPTION: Creates a blue circular shape at (152, 193) with radius 61.
; PLAN: r0=152(x), r1=193(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 193
LDI r2, 61
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
