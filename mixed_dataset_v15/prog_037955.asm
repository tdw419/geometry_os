; DESCRIPTION: Draws a purple line from (418, 16) to (358, 243).
; PLAN: r0=418(x1), r1=16(y1), r2=358(x2), r3=243(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 16
LDI r2, 358
LDI r3, 243
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
