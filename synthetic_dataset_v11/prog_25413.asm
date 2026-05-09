; DESCRIPTION: Draws a red line from (49, 62) to (235, 84).
; PLAN: r0=49(x1), r1=62(y1), r2=235(x2), r3=84(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 62
LDI r2, 235
LDI r3, 84
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
