; DESCRIPTION: Places a red line segment connecting (439, 165) to (54, 153).
; PLAN: r0=439(x1), r1=165(y1), r2=54(x2), r3=153(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 165
LDI r2, 54
LDI r3, 153
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
