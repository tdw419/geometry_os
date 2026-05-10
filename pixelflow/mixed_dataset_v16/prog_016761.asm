; DESCRIPTION: Draws a red line from (423, 134) to (400, 12).
; PLAN: r0=423(x1), r1=134(y1), r2=400(x2), r3=12(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 134
LDI r2, 400
LDI r3, 12
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
