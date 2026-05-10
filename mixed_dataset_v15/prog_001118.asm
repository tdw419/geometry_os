; DESCRIPTION: Draws a red line from (91, 158) to (361, 94).
; PLAN: r0=91(x1), r1=158(y1), r2=361(x2), r3=94(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 158
LDI r2, 361
LDI r3, 94
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
