; DESCRIPTION: Places a blue disk with center (217, 76) and radius 63.
; PLAN: r0=217(x), r1=76(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 76
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
