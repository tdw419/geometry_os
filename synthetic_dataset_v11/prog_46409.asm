; DESCRIPTION: Draws a purple line from (204, 113) to (138, 6).
; PLAN: r0=204(x1), r1=113(y1), r2=138(x2), r3=6(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 113
LDI r2, 138
LDI r3, 6
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
