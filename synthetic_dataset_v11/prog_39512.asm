; DESCRIPTION: Places a orange line segment connecting (146, 216) to (240, 229).
; PLAN: r0=146(x1), r1=216(y1), r2=240(x2), r3=229(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 216
LDI r2, 240
LDI r3, 229
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
