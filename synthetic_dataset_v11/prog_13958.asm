; DESCRIPTION: Creates a blue circular shape at (148, 77) with radius 48.
; PLAN: r0=148(x), r1=77(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 77
LDI r2, 48
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
