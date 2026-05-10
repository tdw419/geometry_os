; DESCRIPTION: Places a blue disk with center (231, 41) and radius 23.
; PLAN: r0=231(x), r1=41(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 231
LDI r1, 41
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
