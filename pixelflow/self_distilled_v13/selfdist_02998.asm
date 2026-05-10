; DESCRIPTION: Draws a purple line from (75, 128) to (153, 136).
; PLAN: r0=75(x1), r1=128(y1), r2=153(x2), r3=136(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 128
LDI r2, 153
LDI r3, 136
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
