; DESCRIPTION: Places a purple circle of radius 57 at center (182, 131).
; PLAN: r0=182(x), r1=131(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 131
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
