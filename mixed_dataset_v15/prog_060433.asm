; DESCRIPTION: Draws a purple line from (122, 188) to (243, 138).
; PLAN: r0=122(x1), r1=188(y1), r2=243(x2), r3=138(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 188
LDI r2, 243
LDI r3, 138
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
