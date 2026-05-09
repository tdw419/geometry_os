; DESCRIPTION: Draws a blue line from (87, 155) to (141, 127).
; PLAN: r0=87(x1), r1=155(y1), r2=141(x2), r3=127(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 155
LDI r2, 141
LDI r3, 127
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
