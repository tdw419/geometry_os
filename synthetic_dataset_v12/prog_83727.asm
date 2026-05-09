; DESCRIPTION: Draws a green line from (378, 98) to (155, 252).
; PLAN: r0=378(x1), r1=98(y1), r2=155(x2), r3=252(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 98
LDI r2, 155
LDI r3, 252
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
