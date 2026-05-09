; DESCRIPTION: Creates a magenta circular shape at (55, 162) with radius 19.
; PLAN: r0=55(x), r1=162(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 162
LDI r2, 19
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
