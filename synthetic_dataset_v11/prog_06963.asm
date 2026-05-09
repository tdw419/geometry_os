; DESCRIPTION: Places a purple circle of radius 23 at center (111, 52).
; PLAN: r0=111(x), r1=52(y), r2=23(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 52
LDI r2, 23
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
