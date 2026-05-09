; DESCRIPTION: Places a yellow circle of radius 57 at center (196, 87).
; PLAN: r0=196(x), r1=87(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 87
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
