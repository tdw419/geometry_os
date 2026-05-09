; DESCRIPTION: Places a yellow circle of radius 14 at center (177, 87).
; PLAN: r0=177(x), r1=87(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 87
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
