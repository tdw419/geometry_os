; DESCRIPTION: Draws a blue line from (237, 198) to (104, 129).
; PLAN: r0=237(x1), r1=198(y1), r2=104(x2), r3=129(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 198
LDI r2, 104
LDI r3, 129
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
