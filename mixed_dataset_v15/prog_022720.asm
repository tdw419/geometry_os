; DESCRIPTION: Draws a white line from (157, 62) to (155, 79).
; PLAN: r0=157(x1), r1=62(y1), r2=155(x2), r3=79(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 62
LDI r2, 155
LDI r3, 79
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
