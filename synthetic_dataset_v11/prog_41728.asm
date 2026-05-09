; DESCRIPTION: Places a purple circle of radius 39 at center (209, 88).
; PLAN: r0=209(x), r1=88(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 88
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
