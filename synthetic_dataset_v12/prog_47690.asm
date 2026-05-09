; DESCRIPTION: Draws a purple line from (251, 7) to (217, 114).
; PLAN: r0=251(x1), r1=7(y1), r2=217(x2), r3=114(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 7
LDI r2, 217
LDI r3, 114
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
