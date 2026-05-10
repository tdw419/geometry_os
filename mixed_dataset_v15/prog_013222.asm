; DESCRIPTION: Draws a red line from (54, 22) to (356, 31).
; PLAN: r0=54(x1), r1=22(y1), r2=356(x2), r3=31(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 22
LDI r2, 356
LDI r3, 31
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
