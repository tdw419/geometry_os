; DESCRIPTION: Draws a red line from (278, 235) to (55, 94).
; PLAN: r0=278(x1), r1=235(y1), r2=55(x2), r3=94(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 235
LDI r2, 55
LDI r3, 94
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
