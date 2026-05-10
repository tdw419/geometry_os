; DESCRIPTION: Places a blue disk with center (316, 106) and radius 47.
; PLAN: r0=316(x), r1=106(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 316
LDI r1, 106
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
