; DESCRIPTION: Places a blue disk with center (365, 3) and radius 74.
; PLAN: r0=365(x), r1=3(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 365
LDI r1, 3
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
