; DESCRIPTION: Draws a purple line from (264, 196) to (216, 182).
; PLAN: r0=264(x1), r1=196(y1), r2=216(x2), r3=182(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 196
LDI r2, 216
LDI r3, 182
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
