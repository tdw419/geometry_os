; DESCRIPTION: Draws a blue line from (232, 184) to (101, 164).
; PLAN: r0=232(x1), r1=184(y1), r2=101(x2), r3=164(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 184
LDI r2, 101
LDI r3, 164
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
