; DESCRIPTION: Draws a purple line from (120, 222) to (455, 56).
; PLAN: r0=120(x1), r1=222(y1), r2=455(x2), r3=56(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 222
LDI r2, 455
LDI r3, 56
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
