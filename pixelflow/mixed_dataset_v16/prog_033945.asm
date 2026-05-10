; DESCRIPTION: Places a blue circle of radius 18 at center (297, 195).
; PLAN: r0=297(x), r1=195(y), r2=18(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 297
LDI r1, 195
LDI r2, 18
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
