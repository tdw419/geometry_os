; DESCRIPTION: Places a yellow line segment connecting (107, 41) to (353, 90).
; PLAN: r0=107(x1), r1=41(y1), r2=353(x2), r3=90(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 41
LDI r2, 353
LDI r3, 90
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
