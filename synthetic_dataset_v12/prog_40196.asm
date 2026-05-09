; DESCRIPTION: Creates a blue circular shape at (253, 152) with radius 48.
; PLAN: r0=253(x), r1=152(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 152
LDI r2, 48
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
