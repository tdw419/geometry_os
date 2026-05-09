; DESCRIPTION: Draws a orange line from (246, 72) to (203, 53).
; PLAN: r0=246(x1), r1=72(y1), r2=203(x2), r3=53(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 72
LDI r2, 203
LDI r3, 53
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
