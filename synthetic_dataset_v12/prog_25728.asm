; DESCRIPTION: Draws a magenta line from (332, 217) to (416, 66).
; PLAN: r0=332(x1), r1=217(y1), r2=416(x2), r3=66(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 217
LDI r2, 416
LDI r3, 66
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
