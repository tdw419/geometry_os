; DESCRIPTION: Draws a red line from (163, 21) to (37, 214).
; PLAN: r0=163(x1), r1=21(y1), r2=37(x2), r3=214(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 21
LDI r2, 37
LDI r3, 214
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
