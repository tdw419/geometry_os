; DESCRIPTION: Draws a purple line from (167, 136) to (206, 114).
; PLAN: r0=167(x1), r1=136(y1), r2=206(x2), r3=114(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 136
LDI r2, 206
LDI r3, 114
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
