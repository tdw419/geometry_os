; DESCRIPTION: Creates a blue circular shape at (106, 131) with radius 76.
; PLAN: r0=106(x), r1=131(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 131
LDI r2, 76
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
