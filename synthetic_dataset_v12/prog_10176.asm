; DESCRIPTION: Places a purple circle of radius 24 at center (306, 189).
; PLAN: r0=306(x), r1=189(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 306
LDI r1, 189
LDI r2, 24
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
