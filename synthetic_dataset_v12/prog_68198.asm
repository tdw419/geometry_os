; DESCRIPTION: Places a purple circle of radius 16 at center (266, 166).
; PLAN: r0=266(x), r1=166(y), r2=16(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 266
LDI r1, 166
LDI r2, 16
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
