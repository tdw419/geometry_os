; DESCRIPTION: Draws a purple line from (28, 185) to (230, 213).
; PLAN: r0=28(x1), r1=185(y1), r2=230(x2), r3=213(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 185
LDI r2, 230
LDI r3, 213
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
