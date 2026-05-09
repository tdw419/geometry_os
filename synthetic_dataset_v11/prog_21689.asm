; DESCRIPTION: Places a orange line segment connecting (189, 127) to (236, 95).
; PLAN: r0=189(x1), r1=127(y1), r2=236(x2), r3=95(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 127
LDI r2, 236
LDI r3, 95
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
