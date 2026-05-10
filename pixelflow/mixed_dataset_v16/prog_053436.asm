; DESCRIPTION: Places a orange line segment connecting (411, 156) to (410, 193).
; PLAN: r0=411(x1), r1=156(y1), r2=410(x2), r3=193(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 156
LDI r2, 410
LDI r3, 193
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
