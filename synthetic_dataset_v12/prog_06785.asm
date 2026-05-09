; DESCRIPTION: Draws a blue line from (451, 59) to (33, 83).
; PLAN: r0=451(x1), r1=59(y1), r2=33(x2), r3=83(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 59
LDI r2, 33
LDI r3, 83
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
