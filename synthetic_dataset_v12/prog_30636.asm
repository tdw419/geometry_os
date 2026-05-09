; DESCRIPTION: Draws a red line from (414, 236) to (6, 122).
; PLAN: r0=414(x1), r1=236(y1), r2=6(x2), r3=122(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 236
LDI r2, 6
LDI r3, 122
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
