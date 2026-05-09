; DESCRIPTION: Draws a blue line from (55, 155) to (465, 243).
; PLAN: r0=55(x1), r1=155(y1), r2=465(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 155
LDI r2, 465
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
