; DESCRIPTION: Draws a magenta line from (173, 203) to (47, 97).
; PLAN: r0=173(x1), r1=203(y1), r2=47(x2), r3=97(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 203
LDI r2, 47
LDI r3, 97
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
