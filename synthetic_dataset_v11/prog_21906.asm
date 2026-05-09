; DESCRIPTION: Places a blue circle of radius 61 at center (99, 162).
; PLAN: r0=99(x), r1=162(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 162
LDI r2, 61
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
