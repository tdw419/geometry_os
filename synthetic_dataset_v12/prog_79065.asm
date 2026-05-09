; DESCRIPTION: Creates a blue circular shape at (256, 108) with radius 18.
; PLAN: r0=256(x), r1=108(y), r2=18(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 108
LDI r2, 18
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
