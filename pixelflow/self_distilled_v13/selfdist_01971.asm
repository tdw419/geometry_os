; DESCRIPTION: Places a purple disk with center (140, 165) and radius 18.
; PLAN: r0=140(x), r1=165(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 165
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
