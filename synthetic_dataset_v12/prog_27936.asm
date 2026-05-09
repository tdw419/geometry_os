; DESCRIPTION: Places a red circle of radius 11 at center (449, 241).
; PLAN: r0=449(x), r1=241(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 449
LDI r1, 241
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
