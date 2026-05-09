; DESCRIPTION: Creates a blue circular shape at (108, 30) with radius 21.
; PLAN: r0=108(x), r1=30(y), r2=21(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 30
LDI r2, 21
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
