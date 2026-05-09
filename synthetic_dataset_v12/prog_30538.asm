; DESCRIPTION: Places a purple circle of radius 65 at center (237, 172).
; PLAN: r0=237(x), r1=172(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 172
LDI r2, 65
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
