; DESCRIPTION: Places a purple circle of radius 66 at center (401, 84).
; PLAN: r0=401(x), r1=84(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 84
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
