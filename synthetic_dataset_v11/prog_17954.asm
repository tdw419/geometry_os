; DESCRIPTION: Draws a purple line from (105, 219) to (204, 113).
; PLAN: r0=105(x1), r1=219(y1), r2=204(x2), r3=113(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 219
LDI r2, 204
LDI r3, 113
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
