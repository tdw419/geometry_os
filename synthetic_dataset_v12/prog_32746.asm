; DESCRIPTION: Places a red circle of radius 19 at center (466, 208).
; PLAN: r0=466(x), r1=208(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 466
LDI r1, 208
LDI r2, 19
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
