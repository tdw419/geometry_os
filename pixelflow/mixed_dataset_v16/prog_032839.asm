; DESCRIPTION: Places a yellow circle of radius 15 at center (205, 41).
; PLAN: r0=205(x), r1=41(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 41
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
