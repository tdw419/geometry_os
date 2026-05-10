; DESCRIPTION: Draws a purple line from (180, 177) to (14, 62).
; PLAN: r0=180(x1), r1=177(y1), r2=14(x2), r3=62(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 177
LDI r2, 14
LDI r3, 62
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
