; DESCRIPTION: Draws a red line from (56, 43) to (118, 24).
; PLAN: r0=56(x1), r1=43(y1), r2=118(x2), r3=24(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 43
LDI r2, 118
LDI r3, 24
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
