; DESCRIPTION: Places a orange line segment connecting (186, 151) to (15, 185).
; PLAN: r0=186(x1), r1=151(y1), r2=15(x2), r3=185(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 151
LDI r2, 15
LDI r3, 185
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
