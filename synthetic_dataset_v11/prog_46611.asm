; DESCRIPTION: Draws a red line from (74, 36) to (235, 241).
; PLAN: r0=74(x1), r1=36(y1), r2=235(x2), r3=241(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 36
LDI r2, 235
LDI r3, 241
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
