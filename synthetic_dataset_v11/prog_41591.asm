; DESCRIPTION: Places a red line segment connecting (50, 193) to (80, 38).
; PLAN: r0=50(x1), r1=193(y1), r2=80(x2), r3=38(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 193
LDI r2, 80
LDI r3, 38
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
