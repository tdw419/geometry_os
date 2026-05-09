; DESCRIPTION: Draws a purple line from (62, 164) to (115, 198).
; PLAN: r0=62(x1), r1=164(y1), r2=115(x2), r3=198(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 164
LDI r2, 115
LDI r3, 198
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
