; DESCRIPTION: Draws a purple line from (167, 237) to (428, 136).
; PLAN: r0=167(x1), r1=237(y1), r2=428(x2), r3=136(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 237
LDI r2, 428
LDI r3, 136
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
