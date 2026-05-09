; DESCRIPTION: Places a yellow circle of radius 74 at center (145, 160).
; PLAN: r0=145(x), r1=160(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 160
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
