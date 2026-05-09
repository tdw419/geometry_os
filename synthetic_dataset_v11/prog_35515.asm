; DESCRIPTION: Draws a purple line from (203, 174) to (167, 234).
; PLAN: r0=203(x1), r1=174(y1), r2=167(x2), r3=234(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 174
LDI r2, 167
LDI r3, 234
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
