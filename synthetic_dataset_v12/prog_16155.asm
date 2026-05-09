; DESCRIPTION: Places a yellow circle of radius 39 at center (241, 170).
; PLAN: r0=241(x), r1=170(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 241
LDI r1, 170
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
