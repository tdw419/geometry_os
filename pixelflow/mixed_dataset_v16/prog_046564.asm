; DESCRIPTION: Draws a purple line from (352, 88) to (51, 187).
; PLAN: r0=352(x1), r1=88(y1), r2=51(x2), r3=187(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 88
LDI r2, 51
LDI r3, 187
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
