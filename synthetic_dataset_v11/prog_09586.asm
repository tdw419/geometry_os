; DESCRIPTION: Draws a yellow line from (34, 236) to (26, 212).
; PLAN: r0=34(x1), r1=236(y1), r2=26(x2), r3=212(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 236
LDI r2, 26
LDI r3, 212
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
