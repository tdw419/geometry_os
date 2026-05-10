; DESCRIPTION: Draws a purple line from (112, 117) to (249, 161).
; PLAN: r0=112(x1), r1=117(y1), r2=249(x2), r3=161(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 117
LDI r2, 249
LDI r3, 161
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
