; DESCRIPTION: Creates a blue circular shape at (455, 185) with radius 29.
; PLAN: r0=455(x), r1=185(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 455
LDI r1, 185
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
