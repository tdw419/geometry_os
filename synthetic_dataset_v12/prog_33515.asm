; DESCRIPTION: Places a red circle of radius 14 at center (45, 14).
; PLAN: r0=45(x), r1=14(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 45
LDI r1, 14
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
