; DESCRIPTION: Draws a purple line from (217, 94) to (39, 138).
; PLAN: r0=217(x1), r1=94(y1), r2=39(x2), r3=138(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 94
LDI r2, 39
LDI r3, 138
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
