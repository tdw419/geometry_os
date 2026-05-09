; DESCRIPTION: Draws a yellow line from (135, 28) to (220, 155).
; PLAN: r0=135(x1), r1=28(y1), r2=220(x2), r3=155(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 28
LDI r2, 220
LDI r3, 155
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
