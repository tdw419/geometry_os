; DESCRIPTION: Places a red line segment connecting (54, 77) to (193, 249).
; PLAN: r0=54(x1), r1=77(y1), r2=193(x2), r3=249(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 77
LDI r2, 193
LDI r3, 249
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
