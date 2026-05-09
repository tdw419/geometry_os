; DESCRIPTION: Places a blue circle of radius 73 at center (132, 126).
; PLAN: r0=132(x), r1=126(y), r2=73(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 126
LDI r2, 73
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
