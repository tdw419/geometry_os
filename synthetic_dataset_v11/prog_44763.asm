; DESCRIPTION: Places a orange line segment connecting (87, 25) to (163, 117).
; PLAN: r0=87(x1), r1=25(y1), r2=163(x2), r3=117(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 25
LDI r2, 163
LDI r3, 117
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
