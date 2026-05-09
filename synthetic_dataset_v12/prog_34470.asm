; DESCRIPTION: Places a purple circle of radius 73 at center (148, 161).
; PLAN: r0=148(x), r1=161(y), r2=73(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 161
LDI r2, 73
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
