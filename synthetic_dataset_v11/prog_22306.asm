; DESCRIPTION: Creates a blue circular shape at (101, 135) with radius 38.
; PLAN: r0=101(x), r1=135(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 135
LDI r2, 38
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
