; DESCRIPTION: Draws a red line from (62, 237) to (149, 235).
; PLAN: r0=62(x1), r1=237(y1), r2=149(x2), r3=235(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 237
LDI r2, 149
LDI r3, 235
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
