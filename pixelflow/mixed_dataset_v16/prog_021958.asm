; DESCRIPTION: Draws a blue circle centered at (38, 211) with radius 32.
; PLAN: r0=38(x), r1=211(y), r2=32(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 38
LDI r1, 211
LDI r2, 32
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
