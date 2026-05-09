; DESCRIPTION: Places a yellow circle of radius 71 at center (381, 138).
; PLAN: r0=381(x), r1=138(y), r2=71(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 381
LDI r1, 138
LDI r2, 71
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
