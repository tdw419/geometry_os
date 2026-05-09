; DESCRIPTION: Draws a purple line from (185, 220) to (195, 204).
; PLAN: r0=185(x1), r1=220(y1), r2=195(x2), r3=204(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 220
LDI r2, 195
LDI r3, 204
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
