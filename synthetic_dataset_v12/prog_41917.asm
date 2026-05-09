; DESCRIPTION: Places a purple circle of radius 61 at center (82, 98).
; PLAN: r0=82(x), r1=98(y), r2=61(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 98
LDI r2, 61
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
