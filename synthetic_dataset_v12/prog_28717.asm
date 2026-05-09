; DESCRIPTION: Draws a blue line from (353, 110) to (394, 232).
; PLAN: r0=353(x1), r1=110(y1), r2=394(x2), r3=232(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 110
LDI r2, 394
LDI r3, 232
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
