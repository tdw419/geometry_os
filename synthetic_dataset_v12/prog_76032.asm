; DESCRIPTION: Draws a blue line from (107, 159) to (339, 244).
; PLAN: r0=107(x1), r1=159(y1), r2=339(x2), r3=244(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 159
LDI r2, 339
LDI r3, 244
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
