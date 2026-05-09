; DESCRIPTION: Draws a red line from (212, 66) to (428, 207).
; PLAN: r0=212(x1), r1=66(y1), r2=428(x2), r3=207(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 66
LDI r2, 428
LDI r3, 207
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
