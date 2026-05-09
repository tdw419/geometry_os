; DESCRIPTION: Places a purple circle of radius 52 at center (328, 151).
; PLAN: r0=328(x), r1=151(y), r2=52(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 151
LDI r2, 52
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
