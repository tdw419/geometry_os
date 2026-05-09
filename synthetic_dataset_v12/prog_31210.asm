; DESCRIPTION: Places a orange line segment connecting (462, 210) to (370, 92).
; PLAN: r0=462(x1), r1=210(y1), r2=370(x2), r3=92(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 210
LDI r2, 370
LDI r3, 92
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
