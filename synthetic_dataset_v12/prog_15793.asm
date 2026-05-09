; DESCRIPTION: Draws a purple line from (25, 156) to (421, 152).
; PLAN: r0=25(x1), r1=156(y1), r2=421(x2), r3=152(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 156
LDI r2, 421
LDI r3, 152
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
