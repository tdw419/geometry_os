; DESCRIPTION: Places a green circle of radius 13 at center (90, 41).
; PLAN: r0=90(x), r1=41(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 41
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
