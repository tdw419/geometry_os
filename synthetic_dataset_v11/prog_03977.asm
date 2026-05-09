; DESCRIPTION: Draws a blue line from (8, 218) to (192, 214).
; PLAN: r0=8(x1), r1=218(y1), r2=192(x2), r3=214(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 218
LDI r2, 192
LDI r3, 214
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
