; DESCRIPTION: Draws a blue line from (111, 19) to (84, 102).
; PLAN: r0=111(x1), r1=19(y1), r2=84(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 19
LDI r2, 84
LDI r3, 102
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
