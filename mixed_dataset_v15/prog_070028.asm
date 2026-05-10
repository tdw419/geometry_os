; DESCRIPTION: Places a orange line segment connecting (278, 71) to (195, 162).
; PLAN: r0=278(x1), r1=71(y1), r2=195(x2), r3=162(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 71
LDI r2, 195
LDI r3, 162
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
