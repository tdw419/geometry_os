; DESCRIPTION: Creates a magenta circular shape at (140, 138) with radius 32.
; PLAN: r0=140(x), r1=138(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 138
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
