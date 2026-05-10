; DESCRIPTION: Places a yellow circle of radius 34 at center (127, 157).
; PLAN: r0=127(x), r1=157(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 157
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
