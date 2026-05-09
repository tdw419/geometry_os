; DESCRIPTION: Places a purple circle of radius 38 at center (148, 54).
; PLAN: r0=148(x), r1=54(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 54
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
