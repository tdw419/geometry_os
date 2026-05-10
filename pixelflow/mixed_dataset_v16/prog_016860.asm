; DESCRIPTION: Places a blue circle of radius 36 at center (119, 180).
; PLAN: r0=119(x), r1=180(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 180
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
