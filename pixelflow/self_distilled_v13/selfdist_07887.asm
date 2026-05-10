; DESCRIPTION: Places a blue disk with center (139, 171) and radius 64.
; PLAN: r0=139(x), r1=171(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 171
LDI r2, 64
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
