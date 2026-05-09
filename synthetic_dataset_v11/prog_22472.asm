; DESCRIPTION: Draws a red line from (50, 36) to (186, 130).
; PLAN: r0=50(x1), r1=36(y1), r2=186(x2), r3=130(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 36
LDI r2, 186
LDI r3, 130
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
