; DESCRIPTION: Draws a yellow line from (395, 128) to (451, 123).
; PLAN: r0=395(x1), r1=128(y1), r2=451(x2), r3=123(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 128
LDI r2, 451
LDI r3, 123
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
