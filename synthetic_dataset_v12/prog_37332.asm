; DESCRIPTION: Places a orange line segment connecting (365, 187) to (393, 9).
; PLAN: r0=365(x1), r1=187(y1), r2=393(x2), r3=9(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 187
LDI r2, 393
LDI r3, 9
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
