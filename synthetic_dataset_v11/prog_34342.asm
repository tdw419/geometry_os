; DESCRIPTION: Draws a purple line from (192, 195) to (69, 2).
; PLAN: r0=192(x1), r1=195(y1), r2=69(x2), r3=2(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 195
LDI r2, 69
LDI r3, 2
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
