; DESCRIPTION: Draws a purple line from (203, 199) to (385, 161).
; PLAN: r0=203(x1), r1=199(y1), r2=385(x2), r3=161(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 199
LDI r2, 385
LDI r3, 161
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
