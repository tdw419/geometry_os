; DESCRIPTION: Places a orange line segment connecting (60, 187) to (333, 52).
; PLAN: r0=60(x1), r1=187(y1), r2=333(x2), r3=52(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 187
LDI r2, 333
LDI r3, 52
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
