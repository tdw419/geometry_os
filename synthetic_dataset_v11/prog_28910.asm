; DESCRIPTION: Places a purple circle of radius 40 at center (132, 189).
; PLAN: r0=132(x), r1=189(y), r2=40(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 189
LDI r2, 40
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
