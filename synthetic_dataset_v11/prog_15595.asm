; DESCRIPTION: Draws a blue line from (153, 81) to (45, 179).
; PLAN: r0=153(x1), r1=81(y1), r2=45(x2), r3=179(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 81
LDI r2, 45
LDI r3, 179
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
