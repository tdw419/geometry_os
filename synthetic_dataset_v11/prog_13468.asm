; DESCRIPTION: Places a purple circle of radius 19 at center (215, 86).
; PLAN: r0=215(x), r1=86(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 86
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
