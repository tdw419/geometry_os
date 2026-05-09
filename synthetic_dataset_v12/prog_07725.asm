; DESCRIPTION: Places a green circle of radius 26 at center (297, 28).
; PLAN: r0=297(x), r1=28(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 297
LDI r1, 28
LDI r2, 26
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
