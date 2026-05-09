; DESCRIPTION: Creates a blue circular shape at (159, 143) with radius 22.
; PLAN: r0=159(x), r1=143(y), r2=22(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 143
LDI r2, 22
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
