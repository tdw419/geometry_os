; DESCRIPTION: Draws a red line from (37, 106) to (241, 91).
; PLAN: r0=37(x1), r1=106(y1), r2=241(x2), r3=91(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 106
LDI r2, 241
LDI r3, 91
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
