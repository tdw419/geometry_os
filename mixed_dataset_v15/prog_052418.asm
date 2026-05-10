; DESCRIPTION: Places a red line segment connecting (370, 162) to (50, 30).
; PLAN: r0=370(x1), r1=162(y1), r2=50(x2), r3=30(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 162
LDI r2, 50
LDI r3, 30
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
