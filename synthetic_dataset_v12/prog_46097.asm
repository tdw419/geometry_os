; DESCRIPTION: Draws a red line from (430, 88) to (115, 244).
; PLAN: r0=430(x1), r1=88(y1), r2=115(x2), r3=244(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 88
LDI r2, 115
LDI r3, 244
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
