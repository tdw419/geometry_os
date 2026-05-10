; DESCRIPTION: Places a blue disk with center (274, 184) and radius 57.
; PLAN: r0=274(x), r1=184(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 274
LDI r1, 184
LDI r2, 57
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
