; DESCRIPTION: Draws a red line from (203, 123) to (144, 25).
; PLAN: r0=203(x1), r1=123(y1), r2=144(x2), r3=25(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 123
LDI r2, 144
LDI r3, 25
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
