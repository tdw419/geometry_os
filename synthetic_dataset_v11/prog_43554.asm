; DESCRIPTION: Draws a green line from (155, 50) to (189, 199).
; PLAN: r0=155(x1), r1=50(y1), r2=189(x2), r3=199(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 50
LDI r2, 189
LDI r3, 199
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
