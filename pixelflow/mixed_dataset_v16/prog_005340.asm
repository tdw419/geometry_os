; DESCRIPTION: Places a orange line segment connecting (91, 22) to (486, 177).
; PLAN: r0=91(x1), r1=22(y1), r2=486(x2), r3=177(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 22
LDI r2, 486
LDI r3, 177
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
