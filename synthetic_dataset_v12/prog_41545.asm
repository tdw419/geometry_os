; DESCRIPTION: Creates a magenta circular shape at (79, 140) with radius 44.
; PLAN: r0=79(x), r1=140(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 140
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
