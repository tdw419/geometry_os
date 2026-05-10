; DESCRIPTION: Draws a red line from (220, 85) to (296, 235).
; PLAN: r0=220(x1), r1=85(y1), r2=296(x2), r3=235(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 85
LDI r2, 296
LDI r3, 235
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
