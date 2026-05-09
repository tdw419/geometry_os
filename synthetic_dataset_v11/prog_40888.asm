; DESCRIPTION: Draws a green line from (179, 135) to (163, 136).
; PLAN: r0=179(x1), r1=135(y1), r2=163(x2), r3=136(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 135
LDI r2, 163
LDI r3, 136
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
