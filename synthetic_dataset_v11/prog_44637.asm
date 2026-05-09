; DESCRIPTION: Places a purple circle of radius 45 at center (137, 192).
; PLAN: r0=137(x), r1=192(y), r2=45(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 192
LDI r2, 45
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
