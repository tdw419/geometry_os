; DESCRIPTION: Creates a blue circular shape at (288, 153) with radius 47.
; PLAN: r0=288(x), r1=153(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 288
LDI r1, 153
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
