; DESCRIPTION: Draws a purple line from (465, 251) to (495, 62).
; PLAN: r0=465(x1), r1=251(y1), r2=495(x2), r3=62(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 251
LDI r2, 495
LDI r3, 62
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
