; DESCRIPTION: Draws a blue line from (16, 226) to (181, 163).
; PLAN: r0=16(x1), r1=226(y1), r2=181(x2), r3=163(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 226
LDI r2, 181
LDI r3, 163
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
