; DESCRIPTION: Places a orange line segment connecting (60, 145) to (135, 146).
; PLAN: r0=60(x1), r1=145(y1), r2=135(x2), r3=146(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 145
LDI r2, 135
LDI r3, 146
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
