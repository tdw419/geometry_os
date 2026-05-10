; DESCRIPTION: Places a orange line segment connecting (117, 121) to (150, 90).
; PLAN: r0=117(x1), r1=121(y1), r2=150(x2), r3=90(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 121
LDI r2, 150
LDI r3, 90
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
