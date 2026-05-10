; DESCRIPTION: Draws a red line from (306, 163) to (85, 86).
; PLAN: r0=306(x1), r1=163(y1), r2=85(x2), r3=86(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 163
LDI r2, 85
LDI r3, 86
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
