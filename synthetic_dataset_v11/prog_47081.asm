; DESCRIPTION: Draws a blue line from (223, 231) to (145, 127).
; PLAN: r0=223(x1), r1=231(y1), r2=145(x2), r3=127(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 231
LDI r2, 145
LDI r3, 127
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
