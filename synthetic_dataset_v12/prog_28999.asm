; DESCRIPTION: Draws a purple line from (73, 244) to (188, 71).
; PLAN: r0=73(x1), r1=244(y1), r2=188(x2), r3=71(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 244
LDI r2, 188
LDI r3, 71
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
