; DESCRIPTION: Creates a blue circular shape at (264, 144) with radius 79.
; PLAN: r0=264(x), r1=144(y), r2=79(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 144
LDI r2, 79
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
