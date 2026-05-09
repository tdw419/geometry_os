; DESCRIPTION: Creates a blue circular shape at (247, 188) with radius 17.
; PLAN: r0=247(x), r1=188(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 247
LDI r1, 188
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
