; DESCRIPTION: Places a red line segment connecting (377, 146) to (296, 235).
; PLAN: r0=377(x1), r1=146(y1), r2=296(x2), r3=235(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 146
LDI r2, 296
LDI r3, 235
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
