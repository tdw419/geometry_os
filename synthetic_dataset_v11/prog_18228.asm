; DESCRIPTION: Draws a red line from (37, 148) to (235, 114).
; PLAN: r0=37(x1), r1=148(y1), r2=235(x2), r3=114(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 148
LDI r2, 235
LDI r3, 114
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
