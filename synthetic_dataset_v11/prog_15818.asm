; DESCRIPTION: Draws a green line from (70, 83) to (147, 198).
; PLAN: r0=70(x1), r1=83(y1), r2=147(x2), r3=198(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 83
LDI r2, 147
LDI r3, 198
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
