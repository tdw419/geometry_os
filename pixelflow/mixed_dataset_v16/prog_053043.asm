; DESCRIPTION: Draws a blue line from (491, 83) to (186, 118).
; PLAN: r0=491(x1), r1=83(y1), r2=186(x2), r3=118(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 83
LDI r2, 186
LDI r3, 118
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
