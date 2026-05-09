; DESCRIPTION: Places a red line segment connecting (165, 80) to (95, 193).
; PLAN: r0=165(x1), r1=80(y1), r2=95(x2), r3=193(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 80
LDI r2, 95
LDI r3, 193
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
