; DESCRIPTION: Places a purple disk with center (75, 106) and radius 68.
; PLAN: r0=75(x), r1=106(y), r2=68(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 106
LDI r2, 68
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
