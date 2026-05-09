; DESCRIPTION: Draws a purple line from (459, 203) to (458, 178).
; PLAN: r0=459(x1), r1=203(y1), r2=458(x2), r3=178(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 203
LDI r2, 458
LDI r3, 178
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
