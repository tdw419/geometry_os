; DESCRIPTION: Places a red circle of radius 14 at center (313, 79).
; PLAN: r0=313(x), r1=79(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 313
LDI r1, 79
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
