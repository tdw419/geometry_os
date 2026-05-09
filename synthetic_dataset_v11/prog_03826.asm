; DESCRIPTION: Places a green circle of radius 57 at center (158, 144).
; PLAN: r0=158(x), r1=144(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 144
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
