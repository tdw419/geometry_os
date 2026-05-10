; DESCRIPTION: Draws a blue line from (378, 84) to (85, 50).
; PLAN: r0=378(x1), r1=84(y1), r2=85(x2), r3=50(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 84
LDI r2, 85
LDI r3, 50
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
