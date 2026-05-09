; DESCRIPTION: Places a red circle of radius 47 at center (258, 123).
; PLAN: r0=258(x), r1=123(y), r2=47(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 258
LDI r1, 123
LDI r2, 47
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
