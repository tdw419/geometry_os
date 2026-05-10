; DESCRIPTION: Places a yellow circle of radius 77 at center (419, 176).
; PLAN: r0=419(x), r1=176(y), r2=77(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 419
LDI r1, 176
LDI r2, 77
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
