; DESCRIPTION: Draws a blue line from (188, 213) to (161, 232).
; PLAN: r0=188(x1), r1=213(y1), r2=161(x2), r3=232(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 213
LDI r2, 161
LDI r3, 232
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
