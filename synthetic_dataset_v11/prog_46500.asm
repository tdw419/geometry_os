; DESCRIPTION: Draws a blue line from (209, 65) to (133, 181).
; PLAN: r0=209(x1), r1=65(y1), r2=133(x2), r3=181(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 65
LDI r2, 133
LDI r3, 181
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
