; DESCRIPTION: Draws a yellow line from (66, 190) to (391, 155).
; PLAN: r0=66(x1), r1=190(y1), r2=391(x2), r3=155(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 190
LDI r2, 391
LDI r3, 155
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
