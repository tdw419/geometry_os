; DESCRIPTION: Places a purple circle of radius 26 at center (236, 203).
; PLAN: r0=236(x), r1=203(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 203
LDI r2, 26
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
