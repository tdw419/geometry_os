; DESCRIPTION: Creates a blue circular shape at (272, 76) with radius 56.
; PLAN: r0=272(x), r1=76(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 76
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
