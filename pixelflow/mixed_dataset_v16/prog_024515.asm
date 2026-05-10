; DESCRIPTION: Draws a magenta line from (186, 112) to (501, 52).
; PLAN: r0=186(x1), r1=112(y1), r2=501(x2), r3=52(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 112
LDI r2, 501
LDI r3, 52
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
