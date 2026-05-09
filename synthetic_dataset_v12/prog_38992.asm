; DESCRIPTION: Places a purple circle of radius 38 at center (364, 210).
; PLAN: r0=364(x), r1=210(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 210
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
