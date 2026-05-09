; DESCRIPTION: Draws a blue line from (153, 121) to (97, 64).
; PLAN: r0=153(x1), r1=121(y1), r2=97(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 121
LDI r2, 97
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
