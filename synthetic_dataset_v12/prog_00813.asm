; DESCRIPTION: Draws a blue line from (203, 123) to (46, 191).
; PLAN: r0=203(x1), r1=123(y1), r2=46(x2), r3=191(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 123
LDI r2, 46
LDI r3, 191
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
