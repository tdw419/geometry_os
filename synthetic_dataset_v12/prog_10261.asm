; DESCRIPTION: Places a purple circle of radius 33 at center (208, 198).
; PLAN: r0=208(x), r1=198(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 198
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
