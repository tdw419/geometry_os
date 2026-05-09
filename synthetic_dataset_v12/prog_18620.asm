; DESCRIPTION: Places a purple circle of radius 68 at center (183, 75).
; PLAN: r0=183(x), r1=75(y), r2=68(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 75
LDI r2, 68
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
