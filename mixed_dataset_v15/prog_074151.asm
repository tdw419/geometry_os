; DESCRIPTION: Draws a blue line from (113, 197) to (451, 153).
; PLAN: r0=113(x1), r1=197(y1), r2=451(x2), r3=153(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 197
LDI r2, 451
LDI r3, 153
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
