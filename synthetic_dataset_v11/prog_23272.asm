; DESCRIPTION: Places a orange line segment connecting (95, 187) to (159, 8).
; PLAN: r0=95(x1), r1=187(y1), r2=159(x2), r3=8(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 187
LDI r2, 159
LDI r3, 8
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
