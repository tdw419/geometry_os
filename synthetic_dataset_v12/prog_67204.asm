; DESCRIPTION: Places a purple circle of radius 76 at center (157, 177).
; PLAN: r0=157(x), r1=177(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 177
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
