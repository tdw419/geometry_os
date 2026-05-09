; DESCRIPTION: Places a orange line segment connecting (408, 73) to (352, 185).
; PLAN: r0=408(x1), r1=73(y1), r2=352(x2), r3=185(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 73
LDI r2, 352
LDI r3, 185
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
