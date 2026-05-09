; DESCRIPTION: Places a red circle of radius 62 at center (312, 168).
; PLAN: r0=312(x), r1=168(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 312
LDI r1, 168
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
