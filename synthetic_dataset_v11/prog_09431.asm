; DESCRIPTION: Draws a purple line from (122, 3) to (26, 37).
; PLAN: r0=122(x1), r1=3(y1), r2=26(x2), r3=37(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 3
LDI r2, 26
LDI r3, 37
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
