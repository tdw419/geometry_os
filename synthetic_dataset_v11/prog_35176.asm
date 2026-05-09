; DESCRIPTION: Places a yellow circle of radius 14 at center (107, 19).
; PLAN: r0=107(x), r1=19(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 19
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
