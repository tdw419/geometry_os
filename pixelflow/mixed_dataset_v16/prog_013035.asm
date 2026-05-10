; DESCRIPTION: Draws a purple line from (186, 78) to (25, 52).
; PLAN: r0=186(x1), r1=78(y1), r2=25(x2), r3=52(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 78
LDI r2, 25
LDI r3, 52
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
