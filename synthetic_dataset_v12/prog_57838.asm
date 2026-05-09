; DESCRIPTION: Places a orange line segment connecting (60, 6) to (300, 135).
; PLAN: r0=60(x1), r1=6(y1), r2=300(x2), r3=135(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 6
LDI r2, 300
LDI r3, 135
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
