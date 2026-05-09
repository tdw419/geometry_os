; DESCRIPTION: Places a red line segment connecting (2, 7) to (249, 145).
; PLAN: r0=2(x1), r1=7(y1), r2=249(x2), r3=145(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 7
LDI r2, 249
LDI r3, 145
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
