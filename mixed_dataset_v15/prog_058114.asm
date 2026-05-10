; DESCRIPTION: Places a red circle of radius 80 at center (182, 123).
; PLAN: r0=182(x), r1=123(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 123
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
