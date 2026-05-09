; DESCRIPTION: Draws a purple line from (152, 157) to (43, 181).
; PLAN: r0=152(x1), r1=157(y1), r2=43(x2), r3=181(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 157
LDI r2, 43
LDI r3, 181
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
