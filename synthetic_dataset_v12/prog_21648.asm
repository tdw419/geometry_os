; DESCRIPTION: Draws a purple line from (499, 148) to (129, 1).
; PLAN: r0=499(x1), r1=148(y1), r2=129(x2), r3=1(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 148
LDI r2, 129
LDI r3, 1
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
