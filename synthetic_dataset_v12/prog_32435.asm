; DESCRIPTION: Draws a purple line from (129, 141) to (90, 150).
; PLAN: r0=129(x1), r1=141(y1), r2=90(x2), r3=150(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 141
LDI r2, 90
LDI r3, 150
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
