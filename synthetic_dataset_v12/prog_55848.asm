; DESCRIPTION: Draws a green line from (188, 65) to (378, 90).
; PLAN: r0=188(x1), r1=65(y1), r2=378(x2), r3=90(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 65
LDI r2, 378
LDI r3, 90
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
