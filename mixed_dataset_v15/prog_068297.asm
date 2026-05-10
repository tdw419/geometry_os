; DESCRIPTION: Draws a blue line from (486, 131) to (175, 13).
; PLAN: r0=486(x1), r1=131(y1), r2=175(x2), r3=13(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 131
LDI r2, 175
LDI r3, 13
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
