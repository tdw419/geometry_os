; DESCRIPTION: Draws a blue line from (477, 192) to (127, 199).
; PLAN: r0=477(x1), r1=192(y1), r2=127(x2), r3=199(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 192
LDI r2, 127
LDI r3, 199
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
