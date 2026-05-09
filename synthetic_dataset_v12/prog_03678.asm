; DESCRIPTION: Draws a purple line from (250, 111) to (205, 205).
; PLAN: r0=250(x1), r1=111(y1), r2=205(x2), r3=205(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 111
LDI r2, 205
LDI r3, 205
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
