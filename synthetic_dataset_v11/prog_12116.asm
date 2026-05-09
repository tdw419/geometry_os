; DESCRIPTION: Places a orange line segment connecting (32, 187) to (91, 36).
; PLAN: r0=32(x1), r1=187(y1), r2=91(x2), r3=36(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 187
LDI r2, 91
LDI r3, 36
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
