; DESCRIPTION: Draws a blue line from (81, 230) to (108, 230).
; PLAN: r0=81(x1), r1=230(y1), r2=108(x2), r3=230(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 230
LDI r2, 108
LDI r3, 230
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
