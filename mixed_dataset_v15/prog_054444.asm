; DESCRIPTION: Draws a red line from (306, 170) to (89, 193).
; PLAN: r0=306(x1), r1=170(y1), r2=89(x2), r3=193(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 170
LDI r2, 89
LDI r3, 193
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
