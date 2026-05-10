; DESCRIPTION: Places a red circle of radius 26 at center (333, 99).
; PLAN: r0=333(x), r1=99(y), r2=26(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 333
LDI r1, 99
LDI r2, 26
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
