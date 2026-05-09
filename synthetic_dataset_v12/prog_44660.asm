; DESCRIPTION: Places a purple circle of radius 27 at center (86, 79).
; PLAN: r0=86(x), r1=79(y), r2=27(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 79
LDI r2, 27
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
