; DESCRIPTION: Places a blue disk with center (41, 58) and radius 44.
; PLAN: r0=41(x), r1=58(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 58
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
