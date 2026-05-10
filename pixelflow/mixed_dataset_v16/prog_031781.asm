; DESCRIPTION: Places a red circle of radius 79 at center (191, 109).
; PLAN: r0=191(x), r1=109(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 109
LDI r2, 79
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
