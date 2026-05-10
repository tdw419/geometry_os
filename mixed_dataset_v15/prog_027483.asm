; DESCRIPTION: Places a red line segment connecting (197, 186) to (335, 123).
; PLAN: r0=197(x1), r1=186(y1), r2=335(x2), r3=123(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 186
LDI r2, 335
LDI r3, 123
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
