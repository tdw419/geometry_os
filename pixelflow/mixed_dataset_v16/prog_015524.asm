; DESCRIPTION: Creates a blue circular shape at (133, 112) with radius 76.
; PLAN: r0=133(x), r1=112(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 112
LDI r2, 76
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
