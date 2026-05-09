; DESCRIPTION: Draws a purple line from (80, 154) to (170, 203).
; PLAN: r0=80(x1), r1=154(y1), r2=170(x2), r3=203(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 154
LDI r2, 170
LDI r3, 203
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
