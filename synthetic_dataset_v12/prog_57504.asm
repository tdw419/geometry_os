; DESCRIPTION: Draws a blue line from (36, 170) to (14, 10).
; PLAN: r0=36(x1), r1=170(y1), r2=14(x2), r3=10(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 170
LDI r2, 14
LDI r3, 10
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
