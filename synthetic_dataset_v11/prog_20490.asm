; DESCRIPTION: Draws a purple line from (63, 58) to (81, 243).
; PLAN: r0=63(x1), r1=58(y1), r2=81(x2), r3=243(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 58
LDI r2, 81
LDI r3, 243
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
