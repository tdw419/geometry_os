; DESCRIPTION: Places a black line segment connecting (397, 170) to (473, 41).
; PLAN: r0=397(x1), r1=170(y1), r2=473(x2), r3=41(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 170
LDI r2, 473
LDI r3, 41
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
