; DESCRIPTION: Draws a red line from (235, 69) to (147, 187).
; PLAN: r0=235(x1), r1=69(y1), r2=147(x2), r3=187(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 69
LDI r2, 147
LDI r3, 187
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
