; DESCRIPTION: Draws a purple line from (133, 192) to (152, 24).
; PLAN: r0=133(x1), r1=192(y1), r2=152(x2), r3=24(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 192
LDI r2, 152
LDI r3, 24
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
