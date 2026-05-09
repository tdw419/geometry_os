; DESCRIPTION: Creates a blue circular shape at (350, 181) with radius 58.
; PLAN: r0=350(x), r1=181(y), r2=58(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 181
LDI r2, 58
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
