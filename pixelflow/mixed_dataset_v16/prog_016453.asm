; DESCRIPTION: Places a red line segment connecting (188, 233) to (308, 8).
; PLAN: r0=188(x1), r1=233(y1), r2=308(x2), r3=8(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 233
LDI r2, 308
LDI r3, 8
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
