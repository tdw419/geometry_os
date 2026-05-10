; DESCRIPTION: Draws a magenta line from (35, 24) to (155, 237).
; PLAN: r0=35(x1), r1=24(y1), r2=155(x2), r3=237(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 24
LDI r2, 155
LDI r3, 237
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
