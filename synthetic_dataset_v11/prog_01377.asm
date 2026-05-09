; DESCRIPTION: Draws a red line from (18, 156) to (70, 217).
; PLAN: r0=18(x1), r1=156(y1), r2=70(x2), r3=217(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 156
LDI r2, 70
LDI r3, 217
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
