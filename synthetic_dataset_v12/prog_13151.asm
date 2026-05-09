; DESCRIPTION: Places a blue circle of radius 49 at center (260, 87).
; PLAN: r0=260(x), r1=87(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 260
LDI r1, 87
LDI r2, 49
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
