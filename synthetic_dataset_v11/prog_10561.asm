; DESCRIPTION: Draws a blue line from (84, 205) to (232, 123).
; PLAN: r0=84(x1), r1=205(y1), r2=232(x2), r3=123(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 205
LDI r2, 232
LDI r3, 123
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
