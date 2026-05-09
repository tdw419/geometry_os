; DESCRIPTION: Draws a red line from (222, 155) to (69, 235).
; PLAN: r0=222(x1), r1=155(y1), r2=69(x2), r3=235(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 155
LDI r2, 69
LDI r3, 235
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
