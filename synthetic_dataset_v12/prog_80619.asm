; DESCRIPTION: Places a purple circle of radius 44 at center (45, 134).
; PLAN: r0=45(x), r1=134(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 45
LDI r1, 134
LDI r2, 44
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
