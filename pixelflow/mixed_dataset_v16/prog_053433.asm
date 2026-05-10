; DESCRIPTION: Places a green line segment connecting (9, 134) to (331, 41).
; PLAN: r0=9(x1), r1=134(y1), r2=331(x2), r3=41(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 134
LDI r2, 331
LDI r3, 41
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
