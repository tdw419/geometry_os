; DESCRIPTION: Creates a purple circular shape at (90, 197) with radius 22.
; PLAN: r0=90(x), r1=197(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 197
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
