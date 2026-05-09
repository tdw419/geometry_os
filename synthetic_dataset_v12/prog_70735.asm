; DESCRIPTION: Places a orange line segment connecting (12, 137) to (207, 127).
; PLAN: r0=12(x1), r1=137(y1), r2=207(x2), r3=127(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 137
LDI r2, 207
LDI r3, 127
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
