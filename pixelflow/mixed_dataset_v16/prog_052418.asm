; DESCRIPTION: Places a purple circle of radius 64 at center (175, 97).
; PLAN: r0=175(x), r1=97(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 97
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
