; DESCRIPTION: Draws a purple line from (329, 33) to (216, 73).
; PLAN: r0=329(x1), r1=33(y1), r2=216(x2), r3=73(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 33
LDI r2, 216
LDI r3, 73
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
