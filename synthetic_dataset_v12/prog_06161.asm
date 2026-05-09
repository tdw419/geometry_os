; DESCRIPTION: Places a purple circle of radius 72 at center (309, 167).
; PLAN: r0=309(x), r1=167(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 309
LDI r1, 167
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
