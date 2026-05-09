; DESCRIPTION: Draws a blue line from (78, 179) to (122, 221).
; PLAN: r0=78(x1), r1=179(y1), r2=122(x2), r3=221(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 179
LDI r2, 122
LDI r3, 221
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
