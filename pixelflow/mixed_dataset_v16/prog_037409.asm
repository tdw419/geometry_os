; DESCRIPTION: Places a red disk with center (161, 4) and radius 78.
; PLAN: r0=161(x), r1=4(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 4
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
