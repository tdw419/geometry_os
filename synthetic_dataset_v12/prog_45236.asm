; DESCRIPTION: Places a purple circle of radius 12 at center (151, 167).
; PLAN: r0=151(x), r1=167(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 167
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
