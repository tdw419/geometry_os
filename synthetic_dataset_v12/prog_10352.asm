; DESCRIPTION: Draws a blue line from (355, 232) to (206, 44).
; PLAN: r0=355(x1), r1=232(y1), r2=206(x2), r3=44(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 232
LDI r2, 206
LDI r3, 44
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
