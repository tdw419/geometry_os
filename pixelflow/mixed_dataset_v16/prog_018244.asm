; DESCRIPTION: Creates a blue circular shape at (122, 79) with radius 56.
; PLAN: r0=122(x), r1=79(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 79
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
