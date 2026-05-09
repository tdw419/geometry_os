; DESCRIPTION: Places a orange line segment connecting (385, 127) to (106, 120).
; PLAN: r0=385(x1), r1=127(y1), r2=106(x2), r3=120(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 127
LDI r2, 106
LDI r3, 120
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
