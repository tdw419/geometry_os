; DESCRIPTION: Places a purple circle of radius 45 at center (395, 87).
; PLAN: r0=395(x), r1=87(y), r2=45(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 395
LDI r1, 87
LDI r2, 45
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
