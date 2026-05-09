; DESCRIPTION: Draws a blue line from (4, 73) to (253, 158).
; PLAN: r0=4(x1), r1=73(y1), r2=253(x2), r3=158(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 73
LDI r2, 253
LDI r3, 158
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
