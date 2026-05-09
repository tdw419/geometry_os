; DESCRIPTION: Places a red line segment connecting (203, 118) to (178, 221).
; PLAN: r0=203(x1), r1=118(y1), r2=178(x2), r3=221(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 118
LDI r2, 178
LDI r3, 221
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
