; DESCRIPTION: Places a orange line segment connecting (91, 93) to (313, 119).
; PLAN: r0=91(x1), r1=93(y1), r2=313(x2), r3=119(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 93
LDI r2, 313
LDI r3, 119
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
