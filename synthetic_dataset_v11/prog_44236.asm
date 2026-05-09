; DESCRIPTION: Places a yellow circle of radius 47 at center (182, 162).
; PLAN: r0=182(x), r1=162(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 162
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
