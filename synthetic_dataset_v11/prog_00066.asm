; DESCRIPTION: Places a red circle of radius 18 at center (130, 205).
; PLAN: r0=130(x), r1=205(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 205
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
