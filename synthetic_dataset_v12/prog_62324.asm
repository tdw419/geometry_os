; DESCRIPTION: Places a red line segment connecting (284, 194) to (158, 145).
; PLAN: r0=284(x1), r1=194(y1), r2=158(x2), r3=145(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 194
LDI r2, 158
LDI r3, 145
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
