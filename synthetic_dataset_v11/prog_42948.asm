; DESCRIPTION: Places a red line segment connecting (229, 5) to (186, 79).
; PLAN: r0=229(x1), r1=5(y1), r2=186(x2), r3=79(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 5
LDI r2, 186
LDI r3, 79
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
