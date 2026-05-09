; DESCRIPTION: Draws a green line from (177, 174) to (489, 130).
; PLAN: r0=177(x1), r1=174(y1), r2=489(x2), r3=130(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 174
LDI r2, 489
LDI r3, 130
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
