; DESCRIPTION: Creates a blue circular shape at (91, 177) with radius 78.
; PLAN: r0=91(x), r1=177(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 177
LDI r2, 78
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
