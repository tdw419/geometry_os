; DESCRIPTION: Draws a blue line from (140, 132) to (180, 104).
; PLAN: r0=140(x1), r1=132(y1), r2=180(x2), r3=104(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 132
LDI r2, 180
LDI r3, 104
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
