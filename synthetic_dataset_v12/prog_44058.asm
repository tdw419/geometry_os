; DESCRIPTION: Draws a purple line from (172, 198) to (217, 164).
; PLAN: r0=172(x1), r1=198(y1), r2=217(x2), r3=164(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 198
LDI r2, 217
LDI r3, 164
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
