; DESCRIPTION: Draws a yellow line from (107, 236) to (188, 94).
; PLAN: r0=107(x1), r1=236(y1), r2=188(x2), r3=94(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 236
LDI r2, 188
LDI r3, 94
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
