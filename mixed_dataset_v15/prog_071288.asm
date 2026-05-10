; DESCRIPTION: Places a blue disk with center (365, 199) and radius 73.
; PLAN: r0=365(x), r1=199(y), r2=73(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 365
LDI r1, 199
LDI r2, 73
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
