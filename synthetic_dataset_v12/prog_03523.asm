; DESCRIPTION: Creates a magenta circular shape at (102, 115) with radius 79.
; PLAN: r0=102(x), r1=115(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 115
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
