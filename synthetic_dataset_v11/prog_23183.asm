; DESCRIPTION: Draws a green line from (95, 66) to (155, 143).
; PLAN: r0=95(x1), r1=66(y1), r2=155(x2), r3=143(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 66
LDI r2, 155
LDI r3, 143
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
