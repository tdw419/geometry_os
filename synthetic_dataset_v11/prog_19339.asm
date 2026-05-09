; DESCRIPTION: Places a purple circle of radius 49 at center (82, 117).
; PLAN: r0=82(x), r1=117(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 117
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
