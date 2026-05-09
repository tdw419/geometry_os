; DESCRIPTION: Places a green circle of radius 14 at center (90, 211).
; PLAN: r0=90(x), r1=211(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 211
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
