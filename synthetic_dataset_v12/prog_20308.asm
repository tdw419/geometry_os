; DESCRIPTION: Places a orange line segment connecting (82, 187) to (505, 36).
; PLAN: r0=82(x1), r1=187(y1), r2=505(x2), r3=36(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 187
LDI r2, 505
LDI r3, 36
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
