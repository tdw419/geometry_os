; DESCRIPTION: Places a red circle of radius 65 at center (194, 152).
; PLAN: r0=194(x), r1=152(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 152
LDI r2, 65
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
