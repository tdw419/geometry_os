; DESCRIPTION: Places a purple disk with center (292, 159) and radius 43.
; PLAN: r0=292(x), r1=159(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 159
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
