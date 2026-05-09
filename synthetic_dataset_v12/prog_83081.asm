; DESCRIPTION: Draws a blue line from (330, 136) to (101, 166).
; PLAN: r0=330(x1), r1=136(y1), r2=101(x2), r3=166(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 136
LDI r2, 101
LDI r3, 166
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
