; DESCRIPTION: Draws a blue line from (97, 130) to (94, 110).
; PLAN: r0=97(x1), r1=130(y1), r2=94(x2), r3=110(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 130
LDI r2, 94
LDI r3, 110
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
