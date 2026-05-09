; DESCRIPTION: Creates a blue circular shape at (153, 112) with radius 16.
; PLAN: r0=153(x), r1=112(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 112
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
