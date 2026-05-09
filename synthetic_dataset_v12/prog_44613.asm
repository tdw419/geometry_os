; DESCRIPTION: Places a purple circle of radius 57 at center (395, 182).
; PLAN: r0=395(x), r1=182(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 395
LDI r1, 182
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
