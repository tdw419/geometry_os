; DESCRIPTION: Draws a red line from (486, 20) to (359, 86).
; PLAN: r0=486(x1), r1=20(y1), r2=359(x2), r3=86(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 20
LDI r2, 359
LDI r3, 86
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
