; DESCRIPTION: Draws a red line from (79, 235) to (140, 49).
; PLAN: r0=79(x1), r1=235(y1), r2=140(x2), r3=49(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 235
LDI r2, 140
LDI r3, 49
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
