; DESCRIPTION: Places a purple circle of radius 64 at center (303, 179).
; PLAN: r0=303(x), r1=179(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 179
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
