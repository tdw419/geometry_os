; DESCRIPTION: Draws a green line from (323, 97) to (246, 136).
; PLAN: r0=323(x1), r1=97(y1), r2=246(x2), r3=136(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 97
LDI r2, 246
LDI r3, 136
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
