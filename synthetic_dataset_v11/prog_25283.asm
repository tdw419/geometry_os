; DESCRIPTION: Draws a magenta line from (253, 81) to (39, 217).
; PLAN: r0=253(x1), r1=81(y1), r2=39(x2), r3=217(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 81
LDI r2, 39
LDI r3, 217
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
