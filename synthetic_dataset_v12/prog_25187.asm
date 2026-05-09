; DESCRIPTION: Draws a red line from (113, 89) to (102, 43).
; PLAN: r0=113(x1), r1=89(y1), r2=102(x2), r3=43(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 89
LDI r2, 102
LDI r3, 43
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
