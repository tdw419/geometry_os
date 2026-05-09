; DESCRIPTION: Draws a purple line from (112, 185) to (295, 52).
; PLAN: r0=112(x1), r1=185(y1), r2=295(x2), r3=52(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 185
LDI r2, 295
LDI r3, 52
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
