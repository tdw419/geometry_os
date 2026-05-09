; DESCRIPTION: Draws a white line from (136, 246) to (273, 1).
; PLAN: r0=136(x1), r1=246(y1), r2=273(x2), r3=1(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 246
LDI r2, 273
LDI r3, 1
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
