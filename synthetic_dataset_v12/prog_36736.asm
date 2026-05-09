; DESCRIPTION: Draws a blue line from (147, 255) to (117, 1).
; PLAN: r0=147(x1), r1=255(y1), r2=117(x2), r3=1(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 255
LDI r2, 117
LDI r3, 1
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
