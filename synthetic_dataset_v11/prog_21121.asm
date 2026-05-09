; DESCRIPTION: Creates a blue circular shape at (143, 80) with radius 62.
; PLAN: r0=143(x), r1=80(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 80
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
