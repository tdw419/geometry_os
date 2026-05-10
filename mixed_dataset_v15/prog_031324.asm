; DESCRIPTION: Draws a purple line from (47, 60) to (132, 174).
; PLAN: r0=47(x1), r1=60(y1), r2=132(x2), r3=174(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 60
LDI r2, 132
LDI r3, 174
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
