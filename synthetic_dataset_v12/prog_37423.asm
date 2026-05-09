; DESCRIPTION: Creates a blue circular shape at (334, 127) with radius 12.
; PLAN: r0=334(x), r1=127(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 127
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
