; DESCRIPTION: Creates a blue circular shape at (164, 89) with radius 59.
; PLAN: r0=164(x), r1=89(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 89
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
