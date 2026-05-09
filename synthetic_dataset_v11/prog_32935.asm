; DESCRIPTION: Creates a magenta circular shape at (101, 152) with radius 73.
; PLAN: r0=101(x), r1=152(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 152
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
