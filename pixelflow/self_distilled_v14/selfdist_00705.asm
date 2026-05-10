; DESCRIPTION: Draws a yellow line from (89, 88) to (132, 4).
; PLAN: r0=89(x1), r1=88(y1), r2=132(x2), r3=4(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 88
LDI r2, 132
LDI r3, 4
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
