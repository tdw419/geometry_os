; DESCRIPTION: Places a red line segment connecting (172, 122) to (79, 163).
; PLAN: r0=172(x1), r1=122(y1), r2=79(x2), r3=163(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 122
LDI r2, 79
LDI r3, 163
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
