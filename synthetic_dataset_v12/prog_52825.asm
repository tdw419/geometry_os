; DESCRIPTION: Places a purple line segment connecting (79, 113) to (278, 46).
; PLAN: r0=79(x1), r1=113(y1), r2=278(x2), r3=46(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 113
LDI r2, 278
LDI r3, 46
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
