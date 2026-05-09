; DESCRIPTION: Draws a purple line from (180, 87) to (177, 21).
; PLAN: r0=180(x1), r1=87(y1), r2=177(x2), r3=21(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 87
LDI r2, 177
LDI r3, 21
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
