; DESCRIPTION: Places a purple disk with center (202, 7) and radius 78.
; PLAN: r0=202(x), r1=7(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 7
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
