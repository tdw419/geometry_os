; DESCRIPTION: Draws a blue line from (84, 224) to (106, 198).
; PLAN: r0=84(x1), r1=224(y1), r2=106(x2), r3=198(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 224
LDI r2, 106
LDI r3, 198
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
