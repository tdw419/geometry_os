; DESCRIPTION: Places a yellow circle of radius 74 at center (285, 87).
; PLAN: r0=285(x), r1=87(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 285
LDI r1, 87
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
