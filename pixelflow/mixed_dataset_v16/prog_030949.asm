; DESCRIPTION: Draws a purple line from (12, 137) to (446, 140).
; PLAN: r0=12(x1), r1=137(y1), r2=446(x2), r3=140(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 137
LDI r2, 446
LDI r3, 140
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
