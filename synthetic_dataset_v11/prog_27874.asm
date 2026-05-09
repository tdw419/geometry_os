; DESCRIPTION: Draws a purple line from (243, 49) to (134, 247).
; PLAN: r0=243(x1), r1=49(y1), r2=134(x2), r3=247(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 49
LDI r2, 134
LDI r3, 247
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
