; DESCRIPTION: Places a blue disk with center (207, 77) and radius 38.
; PLAN: r0=207(x), r1=77(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 77
LDI r2, 38
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
