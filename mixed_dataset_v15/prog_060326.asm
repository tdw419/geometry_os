; DESCRIPTION: Creates a purple circular shape at (84, 197) with radius 53.
; PLAN: r0=84(x), r1=197(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 197
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
