; DESCRIPTION: Draws a red line from (180, 246) to (152, 130).
; PLAN: r0=180(x1), r1=246(y1), r2=152(x2), r3=130(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 246
LDI r2, 152
LDI r3, 130
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
