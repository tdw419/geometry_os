; DESCRIPTION: Draws a purple line from (288, 70) to (256, 99).
; PLAN: r0=288(x1), r1=70(y1), r2=256(x2), r3=99(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 70
LDI r2, 256
LDI r3, 99
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
