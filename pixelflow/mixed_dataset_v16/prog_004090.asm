; DESCRIPTION: Places a orange line segment connecting (292, 187) to (272, 31).
; PLAN: r0=292(x1), r1=187(y1), r2=272(x2), r3=31(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 187
LDI r2, 272
LDI r3, 31
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
