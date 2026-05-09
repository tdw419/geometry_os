; DESCRIPTION: Draws a blue line from (129, 249) to (261, 62).
; PLAN: r0=129(x1), r1=249(y1), r2=261(x2), r3=62(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 249
LDI r2, 261
LDI r3, 62
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
