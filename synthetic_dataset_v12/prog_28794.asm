; DESCRIPTION: Draws a blue line from (489, 73) to (179, 195).
; PLAN: r0=489(x1), r1=73(y1), r2=179(x2), r3=195(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 73
LDI r2, 179
LDI r3, 195
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
