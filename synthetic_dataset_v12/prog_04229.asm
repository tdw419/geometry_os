; DESCRIPTION: Draws a blue line from (446, 198) to (19, 68).
; PLAN: r0=446(x1), r1=198(y1), r2=19(x2), r3=68(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 198
LDI r2, 19
LDI r3, 68
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
