; DESCRIPTION: Draws a green line from (229, 2) to (318, 197).
; PLAN: r0=229(x1), r1=2(y1), r2=318(x2), r3=197(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 2
LDI r2, 318
LDI r3, 197
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
