; DESCRIPTION: Places a purple circle of radius 47 at center (154, 194).
; PLAN: r0=154(x), r1=194(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 194
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
