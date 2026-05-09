; DESCRIPTION: Draws a purple line from (353, 222) to (160, 16).
; PLAN: r0=353(x1), r1=222(y1), r2=160(x2), r3=16(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 222
LDI r2, 160
LDI r3, 16
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
