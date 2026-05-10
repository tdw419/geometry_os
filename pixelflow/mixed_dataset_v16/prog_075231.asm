; DESCRIPTION: Places a purple circle of radius 46 at center (413, 193).
; PLAN: r0=413(x), r1=193(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 413
LDI r1, 193
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
