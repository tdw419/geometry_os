; DESCRIPTION: Creates a magenta circular shape at (390, 80) with radius 61.
; PLAN: r0=390(x), r1=80(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 390
LDI r1, 80
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
