; DESCRIPTION: Places a red line segment connecting (152, 212) to (132, 34).
; PLAN: r0=152(x1), r1=212(y1), r2=132(x2), r3=34(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 212
LDI r2, 132
LDI r3, 34
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
