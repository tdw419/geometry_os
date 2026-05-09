; DESCRIPTION: Draws a purple line from (294, 148) to (459, 181).
; PLAN: r0=294(x1), r1=148(y1), r2=459(x2), r3=181(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 148
LDI r2, 459
LDI r3, 181
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
