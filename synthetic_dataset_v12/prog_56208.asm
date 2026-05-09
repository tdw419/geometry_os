; DESCRIPTION: Places a yellow circle of radius 25 at center (61, 150).
; PLAN: r0=61(x), r1=150(y), r2=25(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 150
LDI r2, 25
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
