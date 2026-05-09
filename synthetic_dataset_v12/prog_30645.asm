; DESCRIPTION: Draws a red line from (166, 235) to (102, 118).
; PLAN: r0=166(x1), r1=235(y1), r2=102(x2), r3=118(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 235
LDI r2, 102
LDI r3, 118
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
