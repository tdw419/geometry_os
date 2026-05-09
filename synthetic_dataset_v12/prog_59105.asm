; DESCRIPTION: Places a orange line segment connecting (6, 115) to (398, 229).
; PLAN: r0=6(x1), r1=115(y1), r2=398(x2), r3=229(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 115
LDI r2, 398
LDI r3, 229
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
