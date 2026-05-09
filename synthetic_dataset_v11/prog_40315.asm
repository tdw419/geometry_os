; DESCRIPTION: Places a blue circle of radius 52 at center (89, 56).
; PLAN: r0=89(x), r1=56(y), r2=52(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 56
LDI r2, 52
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
