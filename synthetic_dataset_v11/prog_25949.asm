; DESCRIPTION: Places a purple circle of radius 28 at center (205, 207).
; PLAN: r0=205(x), r1=207(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 207
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
