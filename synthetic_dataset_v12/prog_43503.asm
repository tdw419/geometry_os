; DESCRIPTION: Draws a purple line from (446, 119) to (178, 74).
; PLAN: r0=446(x1), r1=119(y1), r2=178(x2), r3=74(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 119
LDI r2, 178
LDI r3, 74
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
