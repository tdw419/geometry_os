; DESCRIPTION: Places a orange line segment connecting (398, 118) to (229, 14).
; PLAN: r0=398(x1), r1=118(y1), r2=229(x2), r3=14(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 118
LDI r2, 229
LDI r3, 14
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
