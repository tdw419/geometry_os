; DESCRIPTION: Places a red circle of radius 35 at center (357, 121).
; PLAN: r0=357(x), r1=121(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 357
LDI r1, 121
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
