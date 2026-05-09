; DESCRIPTION: Draws a magenta line from (230, 121) to (227, 25).
; PLAN: r0=230(x1), r1=121(y1), r2=227(x2), r3=25(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 121
LDI r2, 227
LDI r3, 25
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
