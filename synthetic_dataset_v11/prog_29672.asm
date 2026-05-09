; DESCRIPTION: Draws a purple line from (222, 108) to (180, 246).
; PLAN: r0=222(x1), r1=108(y1), r2=180(x2), r3=246(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 108
LDI r2, 180
LDI r3, 246
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
