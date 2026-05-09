; DESCRIPTION: Places a red circle of radius 45 at center (161, 175).
; PLAN: r0=161(x), r1=175(y), r2=45(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 175
LDI r2, 45
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
