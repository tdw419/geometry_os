; DESCRIPTION: Draws a purple line from (194, 238) to (1, 225).
; PLAN: r0=194(x1), r1=238(y1), r2=1(x2), r3=225(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 238
LDI r2, 1
LDI r3, 225
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
