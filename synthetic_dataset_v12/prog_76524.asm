; DESCRIPTION: Places a red circle of radius 50 at center (133, 123).
; PLAN: r0=133(x), r1=123(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 123
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
