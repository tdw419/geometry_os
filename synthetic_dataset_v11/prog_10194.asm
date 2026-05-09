; DESCRIPTION: Places a red line segment connecting (247, 65) to (162, 152).
; PLAN: r0=247(x1), r1=65(y1), r2=162(x2), r3=152(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 65
LDI r2, 162
LDI r3, 152
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
