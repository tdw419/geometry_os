; DESCRIPTION: Creates a blue circular shape at (44, 152) with radius 19.
; PLAN: r0=44(x), r1=152(y), r2=19(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 44
LDI r1, 152
LDI r2, 19
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
