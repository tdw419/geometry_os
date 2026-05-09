; DESCRIPTION: Places a green circle of radius 37 at center (81, 118).
; PLAN: r0=81(x), r1=118(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 118
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
