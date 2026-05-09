; DESCRIPTION: Places a green circle of radius 50 at center (179, 114).
; PLAN: r0=179(x), r1=114(y), r2=50(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 114
LDI r2, 50
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
