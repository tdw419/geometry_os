; DESCRIPTION: Draws a blue line from (237, 77) to (511, 232).
; PLAN: r0=237(x1), r1=77(y1), r2=511(x2), r3=232(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 77
LDI r2, 511
LDI r3, 232
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
