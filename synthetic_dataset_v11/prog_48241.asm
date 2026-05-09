; DESCRIPTION: Draws a purple line from (87, 203) to (108, 249).
; PLAN: r0=87(x1), r1=203(y1), r2=108(x2), r3=249(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 203
LDI r2, 108
LDI r3, 249
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
