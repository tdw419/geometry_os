; DESCRIPTION: Places a green circle of radius 37 at center (126, 88).
; PLAN: r0=126(x), r1=88(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 88
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
