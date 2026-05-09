; DESCRIPTION: Draws a red line from (186, 177) to (91, 119).
; PLAN: r0=186(x1), r1=177(y1), r2=91(x2), r3=119(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 177
LDI r2, 91
LDI r3, 119
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
