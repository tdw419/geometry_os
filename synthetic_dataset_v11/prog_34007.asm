; DESCRIPTION: Creates a magenta circular shape at (142, 132) with radius 26.
; PLAN: r0=142(x), r1=132(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 132
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
