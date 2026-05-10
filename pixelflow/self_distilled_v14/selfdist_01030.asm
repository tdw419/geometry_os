; DESCRIPTION: Places a purple disk with center (367, 194) and radius 35.
; PLAN: r0=367(x), r1=194(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 194
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
