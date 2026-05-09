; DESCRIPTION: Draws a red line from (5, 119) to (52, 156).
; PLAN: r0=5(x1), r1=119(y1), r2=52(x2), r3=156(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 119
LDI r2, 52
LDI r3, 156
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
