; DESCRIPTION: Draws a purple line from (108, 213) to (181, 85).
; PLAN: r0=108(x1), r1=213(y1), r2=181(x2), r3=85(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 213
LDI r2, 181
LDI r3, 85
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
