; DESCRIPTION: Places a orange line segment connecting (468, 247) to (75, 236).
; PLAN: r0=468(x1), r1=247(y1), r2=75(x2), r3=236(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 247
LDI r2, 75
LDI r3, 236
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
