; DESCRIPTION: Draws a blue line from (222, 167) to (118, 139).
; PLAN: r0=222(x1), r1=167(y1), r2=118(x2), r3=139(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 167
LDI r2, 118
LDI r3, 139
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
