; DESCRIPTION: Draws a blue line from (218, 185) to (108, 17).
; PLAN: r0=218(x1), r1=185(y1), r2=108(x2), r3=17(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 185
LDI r2, 108
LDI r3, 17
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
