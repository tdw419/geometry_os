; DESCRIPTION: Draws a red line from (37, 74) to (241, 150).
; PLAN: r0=37(x1), r1=74(y1), r2=241(x2), r3=150(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 74
LDI r2, 241
LDI r3, 150
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
