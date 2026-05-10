; DESCRIPTION: Draws a blue line from (117, 2) to (132, 9).
; PLAN: r0=117(x1), r1=2(y1), r2=132(x2), r3=9(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 2
LDI r2, 132
LDI r3, 9
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
