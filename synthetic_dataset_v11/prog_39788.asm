; DESCRIPTION: Draws a purple line from (49, 113) to (58, 213).
; PLAN: r0=49(x1), r1=113(y1), r2=58(x2), r3=213(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 113
LDI r2, 58
LDI r3, 213
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
