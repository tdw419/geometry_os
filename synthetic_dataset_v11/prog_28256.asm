; DESCRIPTION: Draws a green line from (26, 155) to (198, 66).
; PLAN: r0=26(x1), r1=155(y1), r2=198(x2), r3=66(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 155
LDI r2, 198
LDI r3, 66
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
