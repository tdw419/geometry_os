; DESCRIPTION: Places a red line segment connecting (200, 150) to (120, 225).
; PLAN: r0=200(x1), r1=150(y1), r2=120(x2), r3=225(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 150
LDI r2, 120
LDI r3, 225
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
