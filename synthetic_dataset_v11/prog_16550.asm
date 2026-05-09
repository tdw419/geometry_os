; DESCRIPTION: Draws a red line from (251, 62) to (136, 122).
; PLAN: r0=251(x1), r1=62(y1), r2=136(x2), r3=122(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 62
LDI r2, 136
LDI r3, 122
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
