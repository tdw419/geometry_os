; DESCRIPTION: Places a purple disk with center (66, 144) and radius 11.
; PLAN: r0=66(x), r1=144(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 144
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
