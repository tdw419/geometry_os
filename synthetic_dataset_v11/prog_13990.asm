; DESCRIPTION: Draws a blue line from (238, 36) to (234, 211).
; PLAN: r0=238(x1), r1=36(y1), r2=234(x2), r3=211(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 36
LDI r2, 234
LDI r3, 211
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
