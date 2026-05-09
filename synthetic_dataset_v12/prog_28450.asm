; DESCRIPTION: Draws a blue line from (240, 19) to (3, 216).
; PLAN: r0=240(x1), r1=19(y1), r2=3(x2), r3=216(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 19
LDI r2, 3
LDI r3, 216
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
