; DESCRIPTION: Draws a red line from (466, 97) to (112, 50).
; PLAN: r0=466(x1), r1=97(y1), r2=112(x2), r3=50(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 97
LDI r2, 112
LDI r3, 50
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
