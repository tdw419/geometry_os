; DESCRIPTION: Places a purple circle of radius 40 at center (178, 90).
; PLAN: r0=178(x), r1=90(y), r2=40(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 90
LDI r2, 40
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
