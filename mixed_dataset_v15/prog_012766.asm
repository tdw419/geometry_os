; DESCRIPTION: Creates a blue circular shape at (143, 169) with radius 56.
; PLAN: r0=143(x), r1=169(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 169
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
