; DESCRIPTION: Draws a red line from (183, 202) to (112, 75).
; PLAN: r0=183(x1), r1=202(y1), r2=112(x2), r3=75(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 202
LDI r2, 112
LDI r3, 75
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
