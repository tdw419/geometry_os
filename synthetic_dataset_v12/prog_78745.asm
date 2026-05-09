; DESCRIPTION: Places a blue circle of radius 22 at center (417, 135).
; PLAN: r0=417(x), r1=135(y), r2=22(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 135
LDI r2, 22
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
