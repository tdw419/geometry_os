; DESCRIPTION: Places a yellow circle of radius 39 at center (293, 56).
; PLAN: r0=293(x), r1=56(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 56
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
