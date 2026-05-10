; DESCRIPTION: Creates a magenta circular shape at (69, 115) with radius 18.
; PLAN: r0=69(x), r1=115(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 115
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
