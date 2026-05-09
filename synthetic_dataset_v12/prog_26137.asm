; DESCRIPTION: Draws a red line from (12, 238) to (369, 50).
; PLAN: r0=12(x1), r1=238(y1), r2=369(x2), r3=50(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 238
LDI r2, 369
LDI r3, 50
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
