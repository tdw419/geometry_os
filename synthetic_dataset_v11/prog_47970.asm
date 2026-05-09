; DESCRIPTION: Places a green circle of radius 15 at center (216, 101).
; PLAN: r0=216(x), r1=101(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 101
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
