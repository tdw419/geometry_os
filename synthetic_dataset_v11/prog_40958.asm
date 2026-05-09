; DESCRIPTION: Places a purple circle of radius 40 at center (103, 137).
; PLAN: r0=103(x), r1=137(y), r2=40(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 137
LDI r2, 40
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
