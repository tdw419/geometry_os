; DESCRIPTION: Places a purple circle of radius 75 at center (121, 87).
; PLAN: r0=121(x), r1=87(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 87
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
