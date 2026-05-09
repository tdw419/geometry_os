; DESCRIPTION: Places a orange line segment connecting (350, 82) to (137, 181).
; PLAN: r0=350(x1), r1=82(y1), r2=137(x2), r3=181(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 82
LDI r2, 137
LDI r3, 181
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
