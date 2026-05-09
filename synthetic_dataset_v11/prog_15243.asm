; DESCRIPTION: Draws a purple line from (33, 183) to (86, 162).
; PLAN: r0=33(x1), r1=183(y1), r2=86(x2), r3=162(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 183
LDI r2, 86
LDI r3, 162
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
