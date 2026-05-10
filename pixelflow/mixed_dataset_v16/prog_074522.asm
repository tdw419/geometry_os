; DESCRIPTION: Draws a blue line from (196, 155) to (283, 96).
; PLAN: r0=196(x1), r1=155(y1), r2=283(x2), r3=96(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 155
LDI r2, 283
LDI r3, 96
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
