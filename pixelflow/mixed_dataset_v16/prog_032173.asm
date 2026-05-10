; DESCRIPTION: Draws a purple line from (140, 84) to (495, 37).
; PLAN: r0=140(x1), r1=84(y1), r2=495(x2), r3=37(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 84
LDI r2, 495
LDI r3, 37
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
