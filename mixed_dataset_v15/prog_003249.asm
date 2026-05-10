; DESCRIPTION: Places a red circle of radius 33 at center (40, 123).
; PLAN: r0=40(x), r1=123(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 40
LDI r1, 123
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
