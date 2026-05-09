; DESCRIPTION: Draws a red line from (339, 80) to (251, 235).
; PLAN: r0=339(x1), r1=80(y1), r2=251(x2), r3=235(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 80
LDI r2, 251
LDI r3, 235
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
