; DESCRIPTION: Draws a purple line from (54, 43) to (213, 61).
; PLAN: r0=54(x1), r1=43(y1), r2=213(x2), r3=61(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 43
LDI r2, 213
LDI r3, 61
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
