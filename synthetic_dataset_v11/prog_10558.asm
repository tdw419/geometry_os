; DESCRIPTION: Draws a purple line from (129, 161) to (0, 50).
; PLAN: r0=129(x1), r1=161(y1), r2=0(x2), r3=50(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 161
LDI r2, 0
LDI r3, 50
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
