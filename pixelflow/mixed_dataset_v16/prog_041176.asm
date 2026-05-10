; DESCRIPTION: Draws a red line from (143, 90) to (11, 119).
; PLAN: r0=143(x1), r1=90(y1), r2=11(x2), r3=119(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 90
LDI r2, 11
LDI r3, 119
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
