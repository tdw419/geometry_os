; DESCRIPTION: Places a red circle of radius 35 at center (349, 212).
; PLAN: r0=349(x), r1=212(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 349
LDI r1, 212
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
