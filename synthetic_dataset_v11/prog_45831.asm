; DESCRIPTION: Draws a red line from (105, 163) to (2, 230).
; PLAN: r0=105(x1), r1=163(y1), r2=2(x2), r3=230(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 163
LDI r2, 2
LDI r3, 230
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
