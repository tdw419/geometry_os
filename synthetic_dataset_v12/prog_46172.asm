; DESCRIPTION: Places a red line segment connecting (119, 207) to (362, 212).
; PLAN: r0=119(x1), r1=207(y1), r2=362(x2), r3=212(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 207
LDI r2, 362
LDI r3, 212
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
