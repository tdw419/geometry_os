; DESCRIPTION: Draws a red line from (100, 70) to (88, 48).
; PLAN: r0=100(x1), r1=70(y1), r2=88(x2), r3=48(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 70
LDI r2, 88
LDI r3, 48
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
