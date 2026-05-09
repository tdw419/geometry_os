; DESCRIPTION: Draws a purple line from (220, 36) to (249, 180).
; PLAN: r0=220(x1), r1=36(y1), r2=249(x2), r3=180(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 36
LDI r2, 249
LDI r3, 180
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
