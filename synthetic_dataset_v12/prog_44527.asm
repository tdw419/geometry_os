; DESCRIPTION: Draws a blue line from (13, 207) to (63, 88).
; PLAN: r0=13(x1), r1=207(y1), r2=63(x2), r3=88(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 207
LDI r2, 63
LDI r3, 88
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
