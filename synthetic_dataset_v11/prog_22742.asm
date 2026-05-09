; DESCRIPTION: Draws a purple line from (70, 97) to (143, 46).
; PLAN: r0=70(x1), r1=97(y1), r2=143(x2), r3=46(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 97
LDI r2, 143
LDI r3, 46
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
