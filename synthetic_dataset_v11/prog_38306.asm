; DESCRIPTION: Places a orange line segment connecting (7, 127) to (0, 55).
; PLAN: r0=7(x1), r1=127(y1), r2=0(x2), r3=55(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 127
LDI r2, 0
LDI r3, 55
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
