; DESCRIPTION: Places a red line segment connecting (85, 186) to (130, 30).
; PLAN: r0=85(x1), r1=186(y1), r2=130(x2), r3=30(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 186
LDI r2, 130
LDI r3, 30
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
