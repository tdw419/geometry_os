; DESCRIPTION: Draws a purple line from (220, 109) to (19, 65).
; PLAN: r0=220(x1), r1=109(y1), r2=19(x2), r3=65(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 109
LDI r2, 19
LDI r3, 65
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
