; DESCRIPTION: Draws a yellow line from (484, 122) to (63, 189).
; PLAN: r0=484(x1), r1=122(y1), r2=63(x2), r3=189(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 122
LDI r2, 63
LDI r3, 189
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
