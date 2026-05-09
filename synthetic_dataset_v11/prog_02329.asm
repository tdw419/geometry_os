; DESCRIPTION: Places a purple circle of radius 17 at center (23, 231).
; PLAN: r0=23(x), r1=231(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 23
LDI r1, 231
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
