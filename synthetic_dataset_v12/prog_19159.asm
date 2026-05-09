; DESCRIPTION: Places a yellow circle of radius 19 at center (389, 178).
; PLAN: r0=389(x), r1=178(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 178
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
