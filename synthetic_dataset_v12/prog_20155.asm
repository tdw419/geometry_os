; DESCRIPTION: Creates a blue circular shape at (140, 116) with radius 80.
; PLAN: r0=140(x), r1=116(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 116
LDI r2, 80
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
