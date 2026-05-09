; DESCRIPTION: Draws a red line from (13, 251) to (68, 66).
; PLAN: r0=13(x1), r1=251(y1), r2=68(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 251
LDI r2, 68
LDI r3, 66
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
