; DESCRIPTION: Draws a blue line from (72, 38) to (109, 22).
; PLAN: r0=72(x1), r1=38(y1), r2=109(x2), r3=22(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 38
LDI r2, 109
LDI r3, 22
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
