; DESCRIPTION: Draws a purple line from (200, 44) to (127, 182).
; PLAN: r0=200(x1), r1=44(y1), r2=127(x2), r3=182(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 44
LDI r2, 127
LDI r3, 182
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
