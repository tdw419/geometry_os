; DESCRIPTION: Draws a purple line from (150, 177) to (191, 218).
; PLAN: r0=150(x1), r1=177(y1), r2=191(x2), r3=218(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 177
LDI r2, 191
LDI r3, 218
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
