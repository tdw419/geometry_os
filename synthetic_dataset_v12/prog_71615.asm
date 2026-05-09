; DESCRIPTION: Places a red circle of radius 33 at center (85, 155).
; PLAN: r0=85(x), r1=155(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 155
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
