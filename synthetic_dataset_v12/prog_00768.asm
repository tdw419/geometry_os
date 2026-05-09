; DESCRIPTION: Draws a purple line from (252, 177) to (303, 218).
; PLAN: r0=252(x1), r1=177(y1), r2=303(x2), r3=218(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 177
LDI r2, 303
LDI r3, 218
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
