; DESCRIPTION: Places a orange line segment connecting (362, 68) to (457, 187).
; PLAN: r0=362(x1), r1=68(y1), r2=457(x2), r3=187(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 68
LDI r2, 457
LDI r3, 187
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
