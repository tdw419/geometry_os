; DESCRIPTION: Places a green line segment connecting (292, 41) to (317, 78).
; PLAN: r0=292(x1), r1=41(y1), r2=317(x2), r3=78(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 41
LDI r2, 317
LDI r3, 78
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
