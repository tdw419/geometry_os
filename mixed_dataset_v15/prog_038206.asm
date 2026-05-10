; DESCRIPTION: Draws a yellow line from (231, 189) to (318, 70).
; PLAN: r0=231(x1), r1=189(y1), r2=318(x2), r3=70(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 189
LDI r2, 318
LDI r3, 70
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
