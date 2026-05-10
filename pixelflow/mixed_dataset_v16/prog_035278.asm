; DESCRIPTION: Draws a green line from (302, 246) to (185, 12).
; PLAN: r0=302(x1), r1=246(y1), r2=185(x2), r3=12(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 246
LDI r2, 185
LDI r3, 12
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
