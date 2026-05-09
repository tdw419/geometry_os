; DESCRIPTION: Places a green circle of radius 80 at center (297, 105).
; PLAN: r0=297(x), r1=105(y), r2=80(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 297
LDI r1, 105
LDI r2, 80
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
