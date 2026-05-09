; DESCRIPTION: Draws a blue line from (207, 158) to (486, 28).
; PLAN: r0=207(x1), r1=158(y1), r2=486(x2), r3=28(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 158
LDI r2, 486
LDI r3, 28
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
