; DESCRIPTION: Places a red line segment connecting (30, 8) to (30, 80).
; PLAN: r0=30(x1), r1=8(y1), r2=30(x2), r3=80(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 8
LDI r2, 30
LDI r3, 80
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
