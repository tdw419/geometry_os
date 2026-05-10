; DESCRIPTION: Places a blue disk with center (306, 41) and radius 57.
; PLAN: r0=306(x), r1=41(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 306
LDI r1, 41
LDI r2, 57
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
