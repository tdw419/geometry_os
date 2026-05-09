; DESCRIPTION: Creates a blue circular shape at (191, 181) with radius 72.
; PLAN: r0=191(x), r1=181(y), r2=72(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 181
LDI r2, 72
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
