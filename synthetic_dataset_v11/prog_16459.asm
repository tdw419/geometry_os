; DESCRIPTION: Draws a red line from (179, 154) to (188, 112).
; PLAN: r0=179(x1), r1=154(y1), r2=188(x2), r3=112(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 154
LDI r2, 188
LDI r3, 112
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
