; DESCRIPTION: Places a blue line segment connecting (276, 125) to (118, 41).
; PLAN: r0=276(x1), r1=125(y1), r2=118(x2), r3=41(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 125
LDI r2, 118
LDI r3, 41
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
