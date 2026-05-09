; DESCRIPTION: Places a green circle of radius 41 at center (319, 205).
; PLAN: r0=319(x), r1=205(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 319
LDI r1, 205
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
