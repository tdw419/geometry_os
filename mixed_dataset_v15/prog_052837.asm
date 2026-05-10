; DESCRIPTION: Draws a red line from (354, 118) to (189, 84).
; PLAN: r0=354(x1), r1=118(y1), r2=189(x2), r3=84(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 118
LDI r2, 189
LDI r3, 84
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
