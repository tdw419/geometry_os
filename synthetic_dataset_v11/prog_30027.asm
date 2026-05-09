; DESCRIPTION: Draws a blue line from (97, 238) to (171, 112).
; PLAN: r0=97(x1), r1=238(y1), r2=171(x2), r3=112(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 238
LDI r2, 171
LDI r3, 112
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
