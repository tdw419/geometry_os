; DESCRIPTION: Draws a red line from (166, 252) to (192, 156).
; PLAN: r0=166(x1), r1=252(y1), r2=192(x2), r3=156(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 252
LDI r2, 192
LDI r3, 156
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
