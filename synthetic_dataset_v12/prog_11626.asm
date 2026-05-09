; DESCRIPTION: Places a red circle of radius 26 at center (91, 52).
; PLAN: r0=91(x), r1=52(y), r2=26(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 52
LDI r2, 26
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
