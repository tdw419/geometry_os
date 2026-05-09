; DESCRIPTION: Places a yellow circle of radius 30 at center (266, 43).
; PLAN: r0=266(x), r1=43(y), r2=30(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 266
LDI r1, 43
LDI r2, 30
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
