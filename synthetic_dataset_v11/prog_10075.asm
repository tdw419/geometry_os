; DESCRIPTION: Creates a magenta circular shape at (105, 193) with radius 18.
; PLAN: r0=105(x), r1=193(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 193
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
