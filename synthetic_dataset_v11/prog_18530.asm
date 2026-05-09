; DESCRIPTION: Draws a purple line from (125, 152) to (133, 198).
; PLAN: r0=125(x1), r1=152(y1), r2=133(x2), r3=198(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 152
LDI r2, 133
LDI r3, 198
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
