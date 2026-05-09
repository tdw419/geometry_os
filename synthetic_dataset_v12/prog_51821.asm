; DESCRIPTION: Places a blue circle of radius 14 at center (132, 83).
; PLAN: r0=132(x), r1=83(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 83
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
