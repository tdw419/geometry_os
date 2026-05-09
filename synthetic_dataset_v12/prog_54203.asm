; DESCRIPTION: Draws a blue line from (9, 218) to (308, 123).
; PLAN: r0=9(x1), r1=218(y1), r2=308(x2), r3=123(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 218
LDI r2, 308
LDI r3, 123
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
