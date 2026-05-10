; DESCRIPTION: Draws a purple line from (169, 25) to (294, 81).
; PLAN: r0=169(x1), r1=25(y1), r2=294(x2), r3=81(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 25
LDI r2, 294
LDI r3, 81
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
