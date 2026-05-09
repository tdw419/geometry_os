; DESCRIPTION: Places a red circle of radius 72 at center (85, 181).
; PLAN: r0=85(x), r1=181(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 181
LDI r2, 72
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
