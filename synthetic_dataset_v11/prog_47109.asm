; DESCRIPTION: Draws a red line from (52, 88) to (65, 80).
; PLAN: r0=52(x1), r1=88(y1), r2=65(x2), r3=80(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 88
LDI r2, 65
LDI r3, 80
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
